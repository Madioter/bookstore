package com.madiot.bookstore.domain.entity;

/**
 * 用户地址管理
 * Created by julian on 17/1/1.
 */
public class AddressEntity {

    /**
     * id
     */
    private Integer id;

    /**
     * 收件人
     */
    private String receptor;

    /**
     * 收件地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phoneNumber;

    /**
     * 所属用户
     */
    private UserEntity user;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
