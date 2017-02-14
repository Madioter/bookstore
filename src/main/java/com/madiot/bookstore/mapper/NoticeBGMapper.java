package com.madiot.bookstore.mapper;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.NoticeBGDO;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface NoticeBGMapper {

    public int insert(NoticeBGDO entity);

    public int update(NoticeBGDO entity);

    public int used(int id);

    public NoticeBGDO getUsed();

    public List<NoticeBGDO> selectByCondition(PageBean pageBean);

    public int countByCondition(PageBean pageBean);

    public int delete(int id);
}
