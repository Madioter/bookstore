package com.madiot.bookstore.domain.entity;

import java.util.Date;

/**
 * 销售记录
 * Created by julian on 17/1/1.
 */
public class SaleRecordDO {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 销售书籍
     */
    private BookDO book;

    /**
     * 销售日期
     */
    private Date saleDate;

    /**
     * 购买用户
     */
    private UserDO user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BookDO getBook() {
        return book;
    }

    public void setBook(BookDO book) {
        this.book = book;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public UserDO getUser() {
        return user;
    }

    public void setUser(UserDO user) {
        this.user = user;
    }
}
