package com.madiot.bookstore.mapper;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.NoticeDO;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface NoticeMapper {
    public int insert(NoticeDO entity);

    public int update(NoticeDO entity);

    public int top(int id);

    public List<NoticeDO> selectTops(int count);

    public List<NoticeDO> selectByCondition(PageBean pageBean);

    public int countByCondition(PageBean pageBean);

    public int delete(int id);

}
