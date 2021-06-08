package com.amap.amap_flutter_search;

import java.util.List;

public class AMapPOI {
    ///POI全局唯一ID
    private String uid;

    ///名称
    private String name;

    ///兴趣点类型
    private String type;

    ///类型编码
    private String typecode;

    ///经纬度
    private AMapGeoPoint location;

    ///地址
    private String address;

    ///电话
    private String tel;

    ///距中心点的距离，单位米。在周边搜索时有效
    private int distance;

    ///停车场类型，地上、地下、路边
    private String parkingType;

    ///商铺id
    private String shopID;

    ///邮编
    private String postcode;

    ///网址
    private String website;

    ///电子邮件
    private String email;

    ///省
    private String province;

    ///省编码
    private String pcode;

    ///城市名称
    private String city;

    ///城市编码
    private String citycode;

    ///区域名称
    private String district;

    ///区域编码
    private String adcode;

    ///地理格ID
    private String gridcode;

    ///入口经纬度
    private AMapGeoPoint enterLocation;

    ///出口经纬度
    private AMapGeoPoint exitLocation;

    ///方向
    private String direction;

    ///是否有室内地图
    private boolean hasIndoorMap;

    ///所在商圈
    private String businessArea;

    ///室内信息
    private AMapIndoorData indoorData;

    ///子POI列表
    private List<AMapSubPOI> subPOIs;

    ///图片列表
    private List<AMapImage> images;

    ///扩展信息只有在ID查询时有效
    private AMapPOIExtension extensionInfo;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypecode() {
        return typecode;
    }

    public void setTypecode(String typecode) {
        this.typecode = typecode;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getParkingType() {
        return parkingType;
    }

    public void setParkingType(String parkingType) {
        this.parkingType = parkingType;
    }

    public String getShopID() {
        return shopID;
    }

    public void setShopID(String shopID) {
        this.shopID = shopID;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCitycode() {
        return citycode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAdcode() {
        return adcode;
    }

    public void setAdcode(String adcode) {
        this.adcode = adcode;
    }

    public String getGridcode() {
        return gridcode;
    }

    public void setGridcode(String gridcode) {
        this.gridcode = gridcode;
    }

    public AMapGeoPoint getEnterLocation() {
        return enterLocation;
    }

    public void setEnterLocation(AMapGeoPoint enterLocation) {
        this.enterLocation = enterLocation;
    }

    public AMapGeoPoint getExitLocation() {
        return exitLocation;
    }

    public void setExitLocation(AMapGeoPoint exitLocation) {
        this.exitLocation = exitLocation;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public boolean isHasIndoorMap() {
        return hasIndoorMap;
    }

    public void setHasIndoorMap(boolean hasIndoorMap) {
        this.hasIndoorMap = hasIndoorMap;
    }

    public String getBusinessArea() {
        return businessArea;
    }

    public void setBusinessArea(String businessArea) {
        this.businessArea = businessArea;
    }

    public AMapIndoorData getIndoorData() {
        return indoorData;
    }

    public void setIndoorData(AMapIndoorData indoorData) {
        this.indoorData = indoorData;
    }

    public List<AMapSubPOI> getSubPOIs() {
        return subPOIs;
    }

    public void setSubPOIs(List<AMapSubPOI> subPOIs) {
        this.subPOIs = subPOIs;
    }

    public List<AMapImage> getImages() {
        return images;
    }

    public void setImages(List<AMapImage> images) {
        this.images = images;
    }

    public AMapPOIExtension getExtensionInfo() {
        return extensionInfo;
    }

    public void setExtensionInfo(AMapPOIExtension extensionInfo) {
        this.extensionInfo = extensionInfo;
    }
}
