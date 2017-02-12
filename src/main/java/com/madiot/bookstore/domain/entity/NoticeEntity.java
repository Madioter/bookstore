package com.madiot.bookstore.domain.entity;

/**
 * 通知图片框图片定义
 * Created by julian on 16/12/31.
 */
public class NoticeEntity {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 图片路径
     */
    private String imgPath;

    /**
     * 标题
     */
    private String title;

    /**
     * 链接地址
     */
    private String link;

    /**
     * 图片信息
     */
    private String alt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }
}
