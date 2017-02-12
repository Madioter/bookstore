package com.madiot.bookstore.mapper;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.BookEntity;

import java.util.List;

/**
 * Created by julian on 2017/2/12.
 */
public interface NewBookMapper {

    public int insert(BookEntity entity);

    public List<BookEntity> selectByCondition(PageBean<BookEntity> pageBean);

    public int countByCondition(PageBean<BookEntity> pageBean);

    public int delete(int id);
}
