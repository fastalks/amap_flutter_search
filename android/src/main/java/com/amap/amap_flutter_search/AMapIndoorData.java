package com.amap.amap_flutter_search;

public class AMapIndoorData {
    ///楼层，为0时为POI本身
    private int floor;

    ///楼层名称
    private String floorName;

    ///建筑物ID
    private String pid;

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getFloorName() {
        return floorName;
    }

    public void setFloorName(String floorName) {
        this.floorName = floorName;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
