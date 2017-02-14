package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.entity.NoticeBGDO;
import com.madiot.bookstore.domain.vo.NoticeVO;

import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
public interface INoticeService {

    List<NoticeVO> getNotices(int count);

    NoticeBGDO getNoticeBg();
}
