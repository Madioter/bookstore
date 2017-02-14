/**
 * @Title: BookStoreException.java
 * @Package com.madiot.bookstore.common
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.common;

/**
 * @ClassName: BookStoreException
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public class BookStoreException extends Exception {

    public BookStoreException(String message) {
        super(message);
    }

    public BookStoreException(String message, Throwable cause) {
        super(message, cause);
    }

}
