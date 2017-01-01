package com.madiot.bookstore.service;

import com.madiot.bookstore.domian.vo.BookVo;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface IBookService {
    List<BookVo> getNewBooks();

    List<BookVo> getBestSaleBooks();

    List<BookVo> getRecommendedBook();

}
