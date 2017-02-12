package com.madiot.bookstore.domain.vo;

/**
 * 书籍详情
 * Created by julian on 17/1/1.
 */
public class BookVo {

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
    private String publicationDate;

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
    private String cost;

    /**
     * 封面地址
     */
    private String coverPath;

    /**
     * 书籍详情
     */
    private String description;

    /**
     * 链接
     */
    private String link;

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

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
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

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
