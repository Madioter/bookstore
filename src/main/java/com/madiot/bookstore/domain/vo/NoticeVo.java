package com.madiot.bookstore.domain.vo;

/**
 * Created by julian on 16/12/31.
 */
public class NoticeVo {

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
