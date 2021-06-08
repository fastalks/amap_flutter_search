package com.amap.amap_flutter_search;

public class AMapGeoPoint {
    ///纬度（垂直方向）
   private double latitude = 0;

    ///经度（水平方向）
   private double longitude = 0;

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
