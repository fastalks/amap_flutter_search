package com.amap.amap_flutter_search;

public class AMapPOIExtension {
    ///评分
    private double rating = 0;

    ///人均消费
    private double cost = 0;

    ///营业时间
    private String openTime;

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }
}
