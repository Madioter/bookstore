package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.entity.NoticeBGEntity;
import com.madiot.bookstore.domain.vo.NoticeVo;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface INoticeService {

    List<NoticeVo> getNotices(int count);

    NoticeBGEntity getNoticeBg();
}
