package com.amap.amap_flutter_search;

public class AMapStreetNumber {
    ///街道名称
    private String street;

    ///门牌号
    private String number;

    ///坐标点
    private AMapGeoPoint location;

    ///距离（单位：米）
    int distance = 0;

    ///方向
    private String direction;

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public AMapGeoPoint getLocation() {
        return location;
    }

    public void setLocation(AMapGeoPoint location) {
        this.location = location;
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
}
