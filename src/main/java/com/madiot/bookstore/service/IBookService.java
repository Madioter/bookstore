package com.madiot.bookstore.service;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.BookDO;
import com.madiot.bookstore.domain.vo.BookVO;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface IBookService {
    List<BookVO> getNewBooks();

    List<BookVO> getBestSaleBooks();

    List<BookVO> getRecommendedBook();

    void save(BookDO book);

    void delete(String ids);

    void selectByCondition(PageBean<BookVO> pageBean);
}
