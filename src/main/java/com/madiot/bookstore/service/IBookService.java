package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.BookEntity;
import com.madiot.bookstore.domain.vo.BookVo;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface IBookService {
    List<BookVo> getNewBooks();

    List<BookVo> getBestSaleBooks();

    List<BookVo> getRecommendedBook();

    void save(BookEntity book);

    void delete(String ids);

    void selectByCondition(PageBean<BookVo> pageBean);
}
