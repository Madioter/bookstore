package com.madiot.bookstore.mapper;

import com.madiot.bookstore.domian.PageBean;
import com.madiot.bookstore.domian.entity.NoticeEntity;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface NoticeMapper {
    public int insert(NoticeEntity entity);

    public int update(NoticeEntity entity);

    public int top(int id);

    public List<NoticeEntity> selectTops(int count);

    public List<NoticeEntity> selectByCondition(PageBean<NoticeEntity> pageBean);

    public int countByConditon(PageBean<NoticeEntity> pageBean);

    public int delete(int id);

}
