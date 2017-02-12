package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.BookEntity;
import com.madiot.bookstore.domain.vo.BookVo;
import com.madiot.bookstore.mapper.BestSaleMapper;
import com.madiot.bookstore.mapper.NewBookMapper;
import com.madiot.bookstore.mapper.RecommendedMapper;
import org.apache.http.client.utils.DateUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
@Service
public class BookService implements IBookService {

    @Resource
    private NewBookMapper newBookMapper;

    @Resource
    private BestSaleMapper bestSaleMapper;

    @Resource
    private RecommendedMapper recommendedMapper;

    public List<BookVo> getNewBooks() {
        List<BookVo> books = new ArrayList<BookVo>();
        List<BookEntity> bookEntities = newBookMapper.selectByCondition(new PageBean<BookEntity>(5, 1));
        for (BookEntity entity : bookEntities) {
            BookVo bookVo = convert(entity);
            books.add(bookVo);
        }
        return books;
    }

    public BookVo convert(BookEntity entity) {
        BookVo bookVo = new BookVo();
        bookVo.setTitle(entity.getTitle());
        bookVo.setAuthor(entity.getAuthor());
        BigDecimal cost = BigDecimal.valueOf(entity.getCost());
        cost.setScale(2);
        bookVo.setCost(cost.toString());
        bookVo.setCoverPath("book/cover?coverPath=" + entity.getCoverPath());
        bookVo.setIsbn(entity.getIsbn());
        bookVo.setDescription(entity.getDescription());
        bookVo.setPages(entity.getPages());
        bookVo.setPress(entity.getPress());
        bookVo.setPublicationDate(DateUtils.formatDate(entity.getPublicationDate(), "yyyy年MM月dd日"));
        bookVo.setId(entity.getId());
        bookVo.setLink(entity.getLink());
        return bookVo;
    }

    public List<BookVo> getBestSaleBooks() {
        List<BookVo> books = new ArrayList<BookVo>();
        List<BookEntity> bookEntities = bestSaleMapper.selectByCondition(new PageBean<BookEntity>(5, 1));
        for (BookEntity entity : bookEntities) {
            BookVo bookVo = convert(entity);
            books.add(bookVo);
        }
        return books;
    }

    public List<BookVo> getRecommendedBook() {
        List<BookVo> books = new ArrayList<BookVo>();
        List<BookEntity> bookEntities = recommendedMapper.selectByCondition(new PageBean<BookEntity>(5, 1));
        for (BookEntity entity : bookEntities) {
            BookVo bookVo = convert(entity);
            if(bookVo.getDescription().length() > 100) {
                bookVo.setDescription(bookVo.getDescription().substring(0, 90) + "...");
            }
            books.add(bookVo);
        }
        return books;
    }
}
