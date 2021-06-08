package com.amap.amap_flutter_search;

public class AMapBusinessArea {
    ///名称
    private String name;

    ///中心坐标
    private AMapGeoPoint location;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public AMapGeoPoint getLocation() {
        return location;
    }

    public void setLocation(AMapGeoPoint location) {
        this.location = location;
    }
}
