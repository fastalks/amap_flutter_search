package com.amap.amap_flutter_search;

import java.util.List;

public class AMapReGeocode {
    ///格式化地址
    private String formattedAddress;

    ///地址组成要素
    private AMapAddressComponent addressComponent;

    ///道路信息 AMapRoad 数组
    private List<AMapRoad> roads;

    ///道路路口信息 AMapRoadInter 数组
    private List<AMapRoadInter> roadinters;

    ///兴趣点信息 AMapPOI 数组
    private List<AMapPOI> pois;

    ///兴趣区域信息 AMapAOI 数组
    private List<AMapAOI> aois;

    public String getFormattedAddress() {
        return formattedAddress;
    }

    public void setFormattedAddress(String formattedAddress) {
        this.formattedAddress = formattedAddress;
    }

    public AMapAddressComponent getAddressComponent() {
        return addressComponent;
    }

    public void setAddressComponent(AMapAddressComponent addressComponent) {
        this.addressComponent = addressComponent;
    }

    public List<AMapRoad> getRoads() {
        return roads;
    }

    public void setRoads(List<AMapRoad> roads) {
        this.roads = roads;
    }

    public List<AMapRoadInter> getRoadinters() {
        return roadinters;
    }

    public void setRoadinters(List<AMapRoadInter> roadinters) {
        this.roadinters = roadinters;
    }

    public List<AMapPOI> getPois() {
        return pois;
    }

    public void setPois(List<AMapPOI> pois) {
        this.pois = pois;
    }

    public List<AMapAOI> getAois() {
        return aois;
    }

    public void setAois(List<AMapAOI> aois) {
        this.aois = aois;
    }
}
