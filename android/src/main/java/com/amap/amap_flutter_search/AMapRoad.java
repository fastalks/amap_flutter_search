package com.amap.amap_flutter_search;

public class AMapRoad {
    ///道路ID
    private String uid;

    ///道路名称
    private String name;

    ///距离（单位：米）
    int distance = 0;

    ///方向
    private String direction;

    ///坐标点
    private AMapGeoPoint location;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public AMapGeoPoint getLocation() {
        return location;
    }

    public void setLocation(AMapGeoPoint location) {
        this.location = location;
    }
}
