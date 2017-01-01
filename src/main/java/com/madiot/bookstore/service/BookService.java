package com.madiot.bookstore.service;

import com.madiot.bookstore.domian.vo.BookVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
@Service
public class BookService implements IBookService {

    public List<BookVo> getNewBooks() {
        return null;
    }

    public List<BookVo> getBestSaleBooks() {
        return null;
    }

    public List<BookVo> getRecommendedBook() {
        return null;
    }
}
