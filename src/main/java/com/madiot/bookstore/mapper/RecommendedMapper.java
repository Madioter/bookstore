package com.madiot.bookstore.mapper;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.BookDO;

import java.util.List;

/**
 * Created by julian on 2017/2/12.
 */
public interface RecommendedMapper {

    public int insert(BookDO entity);

    public List<BookDO> selectByCondition(PageBean<BookDO> pageBean);

    public int countByCondition(PageBean<BookDO> pageBean);

    public int delete(int id);
}
