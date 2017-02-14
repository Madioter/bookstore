/**
 * @Title: NoticeQuery.java
 * @Package com.madiot.bookstore.common.query
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.common.query;

/**
 * @ClassName: NoticeQuery
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public class NoticeQuery implements IQuery {

    private String title;

    private String alt;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }
}
