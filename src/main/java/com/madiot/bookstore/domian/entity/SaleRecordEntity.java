package com.madiot.bookstore.domian.entity;

import java.util.Date;

/**
 * 销售记录
 * Created by julian on 17/1/1.
 */
public class SaleRecordEntity {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 销售书籍
     */
    private BookEntity book;

    /**
     * 销售日期
     */
    private Date saleDate;

    /**
     * 购买用户
     */
    private UserEntity user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BookEntity getBook() {
        return book;
    }

    public void setBook(BookEntity book) {
        this.book = book;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
