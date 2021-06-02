#import "AmapFlutterSearchPlugin.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MJExtension/MJExtension.h>

@interface AmapFlutterSearchPlugin ()<AMapSearchDelegate>

@property (nonatomic, strong) AMapSearchAPI *searchAPI;
@property (nonatomic, copy) FlutterResult poiResult; //POI回调
@property (nonatomic, copy) FlutterResult reGeoResult; //逆地理编码回调
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
          result(@[].mj_JSONString);
          return;
      }
      if (!city || ![city isKindOfClass:[NSString class]]) {
          result(@[].mj_JSONString);
          return;
      }
      self.poiResult = result;
      [self poiKeywords:keywords city:city];
  }else if([@"reGoecodeSearch" isEqualToString:call.method]){
      NSNumber *latitude = call.arguments[@"latitude"];
      NSNumber *longitude = call.arguments[@"longitude"];
      self.reGeoResult = result;
      [self reGoecodeSearchWithLatitude:latitude.floatValue longitude:longitude.floatValue];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

/* POI 搜索 */
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

/* 逆地理编码 */
- (void)reGoecodeSearchWithLatitude:(CGFloat)latitude  longitude:(CGFloat)longitude{
    AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:latitude longitude:longitude];
    request.requireExtension    = YES;
    [self.searchAPI AMapReGoecodeSearch:request];
}

#pragma mark - delegate
/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{

    if (response.pois.count == 0)
    {
        if (self.poiResult) {
            self.poiResult(@[].mj_JSONString);
        }
        return;
    }
    NSArray *pois = [NSArray mj_keyValuesArrayWithObjectArray:response.pois];
    if (self.poiResult) {
        self.poiResult(pois.mj_JSONString);
    }
}

/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response {
    NSString *result = @"";
    if (response.regeocode) {
        result = [response.regeocode mj_JSONString];
    }
    if (self.reGeoResult) {
        self.reGeoResult(result);
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error{
    if (self.poiResult) {
        self.poiResult(@[].mj_JSONString);
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
