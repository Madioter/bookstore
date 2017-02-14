package com.madiot.bookstore.domain.entity;

import java.util.Date;

/**
 * Created by julian on 17/1/1.
 */
public class BookDO {
    /**
     * 书籍ID
     */
    private Integer id;

    /**
     * 书籍名称
     */
    private String title;

    /**
     * 书籍作者
     */
    private String author;

    /**
     * 发版日期
     */
    private Date publicationDate;

    /**
     * 出版社
     */
    private String press;

    /**
     * ISBN书号
     */
    private String isbn;

    /**
     * 总页数
     */
    private Integer pages;

    /**
     * 书籍售卖价
     */
    private double cost;

    /**
     * 封面地址
     */
    private String coverPath;

    /**
     * 书籍详情
     */
    private String description;

    /**
     * 关联的详情页面
     */
    private String link;

    /**
     * 图书分类
     */
    private int type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
