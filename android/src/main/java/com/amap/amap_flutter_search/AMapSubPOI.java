package com.amap.amap_flutter_search;

public class AMapSubPOI {
    ///POI全局唯一ID
    private String uid;

    ///名称
    private String name;

    ///名称简写
    private String sname;

    ///经纬度
    private AMapGeoPoint location;

    ///地址
    private String address;

    ///距中心点距离
    private int distance;

    ///子POI类型
    private String subtype;

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

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public AMapGeoPoint getLocation() {
        return location;
    }

    public void setLocation(AMapGeoPoint location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getSubtype() {
        return subtype;
    }

    public void setSubtype(String subtype) {
        this.subtype = subtype;
    }
}
