package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.vo.BookVo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
@Service
public class BookService implements IBookService {

    public List<BookVo> getNewBooks() {
        return new ArrayList<BookVo>();
    }

    public List<BookVo> getBestSaleBooks() {
        return null;
    }

    public List<BookVo> getRecommendedBook() {
        return new ArrayList<BookVo>();
    }
}
