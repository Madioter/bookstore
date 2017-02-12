package com.madiot.bookstore.domain.vo;

/**
 * Created by julian on 17/1/1.
 */
public class NoticeBGVo {

    /**
     * 广告的背景图片地址
     */
    private String backgroundImage;

    /**
     * 滚动图片框的x轴位置，距顶部的距离
     */
    private int positionX;

    /**
     * 滚动图片框的Y轴位置，距右侧边的距离
     */
    private int positionY;

    /**
     * 图片框的宽度
     */
    private int width;

    /**
     * 图片框的高度
     */
    private int height;

    public String getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(String backgroundImage) {
        this.backgroundImage = backgroundImage;
    }

    public int getPositionX() {
        return positionX;
    }

    public void setPositionX(int positionX) {
        this.positionX = positionX;
    }

    public int getPositionY() {
        return positionY;
    }

    public void setPositionY(int positionY) {
        this.positionY = positionY;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
}
