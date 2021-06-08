package com.amap.amap_flutter_search;

public class AMapRoadInter {
    ///距离（单位：米）
    int distance = 0;

    ///方向
    private String direction;

    ///经纬度
    private AMapGeoPoint location;

    ///第一条道路ID
    private String firstId;

    ///第一条道路名称
    private String firstName;

    ///第二条道路ID
    private String secondId;

    ///第二条道路名称
    private String secondName;

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

    public String getFirstId() {
        return firstId;
    }

    public void setFirstId(String firstId) {
        this.firstId = firstId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondId() {
        return secondId;
    }

    public void setSecondId(String secondId) {
        this.secondId = secondId;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }
}
