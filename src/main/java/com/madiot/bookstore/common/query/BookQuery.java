/**
 * @Title: BookQuery.java
 * @Package com.madiot.bookstore.common.query
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.common.query;

/**
 * @ClassName: BookQuery
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public class BookQuery implements IQuery {

    private String title;

    private String author;

    private String press;

    private String isbn;

    private int type;

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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
