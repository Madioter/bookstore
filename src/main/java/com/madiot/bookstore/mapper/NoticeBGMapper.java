package com.madiot.bookstore.mapper;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.NoticeBGEntity;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface NoticeBGMapper {

    public int insert(NoticeBGEntity entity);

    public int update(NoticeBGEntity entity);

    public int used(int id);

    public NoticeBGEntity getUsed();

    public List<NoticeBGEntity> selectByCondition(PageBean pageBean);

    public int countByCondition(PageBean pageBean);

    public int delete(int id);
}
