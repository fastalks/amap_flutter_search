package com.amap.amap_flutter_search;

import java.util.List;

public class AMapAddressComponent {
    ///国家（since 5.7.0）
    private String country;

    ///国家简码（since 7.4.0）仅海外生效
    private String countryCode;

    ///省/直辖市
    private String province;

    ///市
    private String city;

    ///城市编码
    private String citycode;

    ///区
    private String district;

    ///区域编码
    private String adcode;

    ///乡镇街道
    private String township;

    ///乡镇街道编码
    private String towncode;

    ///社区
    private String neighborhood;

    ///建筑
    private String building;

    ///门牌信息
    private AMapStreetNumber streetNumber;

    ///商圈列表 AMapBusinessArea 数组
    private List<AMapBusinessArea> businessAreas;

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
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

    public String getTownship() {
        return township;
    }

    public void setTownship(String township) {
        this.township = township;
    }

    public String getTowncode() {
        return towncode;
    }

    public void setTowncode(String towncode) {
        this.towncode = towncode;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public AMapStreetNumber getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(AMapStreetNumber streetNumber) {
        this.streetNumber = streetNumber;
    }

    public List<AMapBusinessArea> getBusinessAreas() {
        return businessAreas;
    }

    public void setBusinessAreas(List<AMapBusinessArea> businessAreas) {
        this.businessAreas = businessAreas;
    }
}
