package com.madiot.bookstore.domain.entity;

/**
 * 通知图片框背景图片以及位置定义
 * Created by julian on 17/1/1.
 */
public class NoticeBGDO {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 背景图片位置
     */
    private String backgroundPath;

    /**
     * 图片框距顶部距离
     */
    private Integer positionX;

    /**
     * 图片框距左边框距离
     */
    private Integer positionY;

    /**
     * 图片框宽度
     */
    private Integer width;

    /**
     * 图片框高度
     */
    private Integer height;

    /**
     * 图片框图片数目
     */
    private Integer noticeCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBackgroundPath() {
        return backgroundPath;
    }

    public void setBackgroundPath(String backgroundPath) {
        this.backgroundPath = backgroundPath;
    }

    public Integer getPositionX() {
        return positionX;
    }

    public void setPositionX(Integer positionX) {
        this.positionX = positionX;
    }

    public Integer getPositionY() {
        return positionY;
    }

    public void setPositionY(Integer positionY) {
        this.positionY = positionY;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getNoticeCount() {
        return noticeCount;
    }

    public void setNoticeCount(Integer noticeCount) {
        this.noticeCount = noticeCount;
    }
}
