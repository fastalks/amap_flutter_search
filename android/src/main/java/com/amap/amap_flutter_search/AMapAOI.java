package com.amap.amap_flutter_search;

public class AMapAOI {
    ///AOI全局唯一ID
    private String uid;

    ///名称
    private String name;

    ///所在区域编码
    private String adcode;

    ///中心点经纬度
    private AMapGeoPoint location;

    ///面积，单位平方米
    double area = 0;

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

    public String getAdcode() {
        return adcode;
    }

    public void setAdcode(String adcode) {
        this.adcode = adcode;
    }

    public AMapGeoPoint getLocation() {
        return location;
    }

    public void setLocation(AMapGeoPoint location) {
        this.location = location;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }
}
