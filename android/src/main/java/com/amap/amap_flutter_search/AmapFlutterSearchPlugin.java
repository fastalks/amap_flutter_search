package com.amap.amap_flutter_search;

import androidx.annotation.NonNull;
import android.text.TextUtils;
import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.amap.api.services.core.LatLonPoint;
import com.amap.api.services.core.PoiItem;
import com.amap.api.services.geocoder.AoiItem;
import com.amap.api.services.geocoder.BusinessArea;
import com.amap.api.services.geocoder.GeocodeResult;
import com.amap.api.services.geocoder.GeocodeSearch;
import com.amap.api.services.geocoder.RegeocodeAddress;
import com.amap.api.services.geocoder.RegeocodeQuery;
import com.amap.api.services.geocoder.RegeocodeResult;
import com.amap.api.services.geocoder.RegeocodeRoad;
import com.amap.api.services.poisearch.Photo;
import com.amap.api.services.poisearch.PoiItemExtension;
import com.amap.api.services.poisearch.PoiResult;
import com.amap.api.services.poisearch.PoiSearch;
import com.amap.api.services.poisearch.SubPoiItem;
import com.amap.api.services.road.Crossroad;
import com.google.gson.Gson;

/** AmapFlutterSearchPlugin */
public class AmapFlutterSearchPlugin implements FlutterPlugin, MethodCallHandler , PoiSearch.OnPoiSearchListener,GeocodeSearch.OnGeocodeSearchListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private PoiSearch poiSearch;
  private Result poiResult;

  private RegeocodeQuery regeocodeQuery;
  private GeocodeSearch geocoderSearch;
  private Result reReocodeResult;

  // 上下文 Context
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    this.context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "amap_flutter_search");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("poiKeywords")) {
      this.poiResult = result;
      Map params = (Map)call.arguments;
      java.lang.String keywords = (String) params.get("keywords");
      java.lang.String city = (String) params.get("city");
      PoiSearch.Query query = new PoiSearch.Query(keywords, "", city);// 第一个参数表示搜索字符串，第二个参数表示poi搜索类型，第三个参数表示poi搜索区域（空字符串代表全国）
      query.setPageSize(30);// 设置每页最多返回多少条poiitem
      query.setPageNum(0);// 设置查第一页
      poiSearch = new PoiSearch(context, query);
      poiSearch.setOnPoiSearchListener(this);
      poiSearch.searchPOIAsyn();

    } else if(call.method.equals("reGoecodeSearch")) {
      this.reReocodeResult = result;
      Map params = (Map)call.arguments;
      double latitude = (double) params.get("latitude");
      double longitude = (double) params.get("longitude");
      LatLonPoint point = new LatLonPoint(latitude,longitude);
      regeocodeQuery  = new RegeocodeQuery(point,1000, GeocodeSearch.AMAP);
      geocoderSearch = new GeocodeSearch(context);
      geocoderSearch.setOnGeocodeSearchListener(this);
      geocoderSearch.getFromLocationAsyn(regeocodeQuery);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onPoiSearched(PoiResult poiResult, int errcode) {

    if (errcode == 1000) {
      List<AMapPOI> datas = this.getPoisFromPoiItems(poiResult.getPois());
      Gson gson = new Gson();
      String result = gson.toJson(datas);
      this.poiResult.success(result);

    }

  }

  @java.lang.Override
  public void onPoiItemSearched(PoiItem poiItem, int i) {

  }

  @java.lang.Override
  public void onRegeocodeSearched(RegeocodeResult var1, int var2) {
    RegeocodeAddress address = var1.getRegeocodeAddress();
    if (address != null){
      AMapReGeocode geocode = new AMapReGeocode();
      geocode.setFormattedAddress(address.getFormatAddress());
      AMapAddressComponent component = new AMapAddressComponent();
      component.setProvince(address.getProvince());
      component.setDistrict(address.getDistrict());
      component.setAdcode(address.getAdCode());
      component.setBuilding(address.getBuilding());
      component.setCity(address.getCity());
      component.setCitycode(address.getCityCode());
      component.setNeighborhood(address.getNeighborhood());
      component.setTowncode(address.getTowncode());
      component.setTownship(address.getTownship());
      if (address.getStreetNumber() != null){
        AMapStreetNumber streetNumber = new AMapStreetNumber();
        streetNumber.setDirection(address.getStreetNumber().getDirection());
        streetNumber.setDistance((int)address.getStreetNumber().getDistance());
        streetNumber.setStreet(address.getStreetNumber().getStreet());
        streetNumber.setNumber(address.getStreetNumber().getNumber());
        LatLonPoint point = address.getStreetNumber().getLatLonPoint();
        if(point != null) {
          AMapGeoPoint location = new AMapGeoPoint();
          location.setLongitude(point.getLongitude());
          location.setLatitude(point.getLatitude());
          streetNumber.setLocation(location);
        }
        component.setStreetNumber(streetNumber);
      }
      component.setBusinessAreas(this.getAmapBusinessAreaFromBusinessArea(address.getBusinessAreas()));
      geocode.setAddressComponent(component);
      geocode.setRoads(this.getRoadsFromRegeocodeRoads(address.getRoads()));
      geocode.setRoadinters(this.getRoadIntersFromCrossRoads(address.getCrossroads()));
      geocode.setPois(this.getPoisFromPoiItems(address.getPois()));
      geocode.setAois(this.getAoisFromAoiitems(address.getAois()));

      Gson gson = new Gson();
      String result = gson.toJson(geocode);
      this.reReocodeResult.success(result);
    }
  }

  @java.lang.Override
  public void onGeocodeSearched(GeocodeResult var1, int var2) {

  }

  //商业兴趣点
  public List<AMapAOI> getAoisFromAoiitems(List<AoiItem> items){

    List<AMapAOI> aois = new ArrayList<>();
    for (int i = 0; i < items.size();i++){
      AoiItem item = items.get(i);
      AMapAOI aoi = new AMapAOI();
      aoi.setUid(item.getAoiId());
      aoi.setName(item.getAoiName());
      aoi.setAdcode(item.getAdCode());
      aoi.setArea(item.getAoiArea());
      LatLonPoint point = item.getAoiCenterPoint();
      if(point != null) {
        AMapGeoPoint location = new AMapGeoPoint();
        location.setLongitude(point.getLongitude());
        location.setLatitude(point.getLatitude());
        aoi.setLocation(location);
      }
      aois.add(aoi);
    }
    return aois;
  }

  public List<AMapBusinessArea> getAmapBusinessAreaFromBusinessArea(List<BusinessArea> items) {
    List<AMapBusinessArea> areas = new ArrayList<>();
    for (int i = 0; i < items.size();i++){
      BusinessArea businessArea = items.get(i);
      AMapBusinessArea area = new AMapBusinessArea();
      area.setName(businessArea.getName());
      LatLonPoint point = businessArea.getCenterPoint();
      if(point != null) {
        AMapGeoPoint location = new AMapGeoPoint();
        location.setLongitude(point.getLongitude());
        location.setLatitude(point.getLatitude());
        area.setLocation(location);
      }
      areas.add(area);
    }
    return areas;
  }

  public List<AMapRoad> getRoadsFromRegeocodeRoads(List<RegeocodeRoad> items){
    List<AMapRoad> roads = new ArrayList<>();
    for (int j = 0; j < items.size(); j++){
      RegeocodeRoad item = items.get(j);
      AMapRoad road = new AMapRoad();
      road.setUid(item.getId());
      road.setName(item.getName());
      road.setDirection(item.getDirection());
      road.setDistance((int)item.getDistance());
      LatLonPoint point = item.getLatLngPoint();
      if(point != null) {
        AMapGeoPoint location = new AMapGeoPoint();
        location.setLongitude(point.getLongitude());
        location.setLatitude(point.getLatitude());
        road.setLocation(location);
      }
      roads.add(road);
    }
    return  roads;
  }

  public List<AMapRoadInter> getRoadIntersFromCrossRoads(List<Crossroad> items){
    List<AMapRoadInter> roadInters = new ArrayList<>();
    for (int m = 0; m < items.size(); m++){
      Crossroad item = items.get(m);
      AMapRoadInter roadInter = new AMapRoadInter();
      roadInter.setFirstId(item.getFirstRoadId());
      roadInter.setFirstName(item.getFirstRoadName());
      roadInter.setSecondId(item.getSecondRoadId());
      roadInter.setSecondName(item.getSecondRoadName());
      roadInter.setDirection(item.getDirection());
      roadInter.setDistance((int)item.getDistance());
      LatLonPoint point = item.getCenterPoint();
      if(point != null) {
        AMapGeoPoint location = new AMapGeoPoint();
        location.setLongitude(point.getLongitude());
        location.setLatitude(point.getLatitude());
        roadInter.setLocation(location);
      }
      roadInters.add(roadInter);
    }
    return roadInters;
  }

  public List<AMapPOI> getPoisFromPoiItems(List<PoiItem> items) {
    ArrayList<AMapPOI> pois = new ArrayList<>();
    for (int i = 0; i < items.size(); i++) {
      PoiItem item = items.get(i);
      AMapPOI poi = this.getPoiFromPoiItem(item);
      pois.add(poi);
    }
    return pois;
  }

  //POI 从android转换成flutter
  public AMapPOI getPoiFromPoiItem(PoiItem item){
    AMapPOI poi = new AMapPOI();
    poi.setUid(item.getPoiId());
    poi.setName(item.getTitle());
    poi.setType(item.getTypeDes());
    poi.setTypecode(item.getTypeCode());
    AMapGeoPoint location = new AMapGeoPoint();
    location.setLatitude(item.getLatLonPoint().getLatitude());
    location.setLongitude(item.getLatLonPoint().getLongitude());
    poi.setLocation(location);
    poi.setAddress(item.getSnippet());
    poi.setTel(item.getTel());
    poi.setDistance(item.getDistance());
    poi.setParkingType(item.getParkingType());
    poi.setShopID(item.getShopID());
    poi.setPostcode(item.getPostcode());
    poi.setWebsite(item.getWebsite());
    poi.setEmail(item.getEmail());
    poi.setProvince(item.getProvinceName());
    poi.setPcode(item.getProvinceCode());
    poi.setCity(item.getCityName());
    poi.setCitycode(item.getCityCode());
    poi.setDistrict(item.getAdName());
    poi.setAdcode(item.getAdCode());
    poi.setGridcode("");
    if(item.getEnter() != null) {
      AMapGeoPoint enterLocation = new AMapGeoPoint();
      enterLocation.setLongitude(item.getEnter().getLongitude());
      enterLocation.setLatitude(item.getEnter().getLatitude());
      poi.setEnterLocation(enterLocation);
    }
    if (item.getExit() != null){
      AMapGeoPoint exitLocation = new AMapGeoPoint();
      exitLocation.setLongitude(item.getExit().getLongitude());
      exitLocation.setLatitude(item.getExit().getLatitude());
      poi.setEnterLocation(exitLocation);
    }

    poi.setDirection(item.getDirection());
    poi.setHasIndoorMap(item.isIndoorMap());
    poi.setBusinessArea(item.getBusinessArea());
    if (item.getIndoorData() != null){
      AMapIndoorData indoorData = new AMapIndoorData();
      indoorData.setPid(item.getIndoorData().getPoiId());
      indoorData.setFloor(item.getIndoorData().getFloor());
      indoorData.setFloorName(item.getIndoorData().getFloorName());
      poi.setIndoorData(indoorData);
    }

    List<SubPoiItem> subPoiItems = item.getSubPois();
    List<AMapSubPOI> subPoiTemps = new ArrayList<>();
    for (int j = 0; j < subPoiItems.size(); j++) {
      SubPoiItem subPoiItem = subPoiItems.get(j);
      AMapSubPOI subPOI = new AMapSubPOI();
      subPOI.setUid(subPoiItem.getPoiId());
      subPOI.setName(subPoiItem.getTitle());
      subPOI.setSname(subPoiItem.getSubName());
      subPOI.setAddress(subPoiItem.getSnippet());
      subPOI.setDistance(subPoiItem.getDistance());
      subPOI.setSubtype(subPoiItem.getSubTypeDes());
      AMapGeoPoint subLocation = new AMapGeoPoint();
      subLocation.setLatitude(subPoiItem.getLatLonPoint().getLatitude());
      subLocation.setLongitude(subPoiItem.getLatLonPoint().getLongitude());
      subPOI.setLocation(subLocation);
      subPoiTemps.add(subPOI);
    }
    poi.setSubPOIs(subPoiTemps);
    List<AMapImage> images = new ArrayList<>();
    for (int m = 0; m < item.getPhotos().size();m++){
      Photo photo = item.getPhotos().get(m);
      AMapImage image = new AMapImage();
      image.setTitle(photo.getTitle());
      image.setUrl(photo.getUrl());
      images.add(image);
    }
    poi.setImages(images);
    AMapPOIExtension extension = new AMapPOIExtension();
    if (!item.getPoiExtension().getmRating().isEmpty()){
      extension.setRating(Double.parseDouble(item.getPoiExtension().getmRating()));
    }
    extension.setOpenTime(item.getPoiExtension().getOpentime());
    poi.setExtensionInfo(extension);
    return  poi;
  }
}
