#import "AmapFlutterSearchPlugin.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MJExtension/MJExtension.h>

@interface AmapFlutterSearchPlugin ()<AMapSearchDelegate>

@property (nonatomic, strong) AMapSearchAPI *searchAPI;
@property (nonatomic, copy) FlutterResult poiResult;

@end

@implementation AmapFlutterSearchPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"amap_flutter_search"
            binaryMessenger:[registrar messenger]];
  AmapFlutterSearchPlugin* instance = [[AmapFlutterSearchPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"poiKeywords" isEqualToString:call.method]){
      NSString *keywords = call.arguments[@"keywords"];
      NSString *city = call.arguments[@"city"];

      if (!keywords || ![keywords isKindOfClass:[NSString class]]) {
          result(@"keywords is not a string");
          return;
      }
      if (!city || ![city isKindOfClass:[NSString class]]) {
          result(@"city is not a string");
          return;
      }
      self.poiResult = result;
      [self poiKeywords:keywords city:city];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)poiKeywords:(NSString*)keywords city:(NSString*)city{
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    request.keywords            = keywords;
    request.city                = city;
    request.requireExtension    = YES;
        
    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
    request.cityLimit           = YES;
    request.requireSubPOIs      = YES;
    [self.searchAPI AMapPOIKeywordsSearch:request];
}


/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{

    if (response.pois.count == 0)
    {
        if (self.poiResult) {
            self.poiResult(@[]);
        }
        return;
    }
    
//    NSArray<AMapPOI *> *pois = response.pois;
    ;
//    NSError *error;
//    NSData *data = [NSJSONSerialization dataWithJSONObject:pois options:NSJSONWritingPrettyPrinted error:&error];
//    if (error) {
//        if (self.poiResult) {
//            self.poiResult(error.description);
//        }
//        return;
//    }
//    NSString *json = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    NSArray *pois = [NSArray mj_keyValuesArrayWithObjectArray:response.pois];
    if (self.poiResult) {
        self.poiResult(pois);
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error{
    if (self.poiResult) {
        self.poiResult(error.description);
    }
}

- (AMapSearchAPI *)searchAPI{
    if (!_searchAPI) {
        _searchAPI = [[AMapSearchAPI alloc] init];
        _searchAPI.delegate = self;
    }
    return _searchAPI;
}
@end
