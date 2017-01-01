package com.madiot.bookstore.service;

import com.madiot.bookstore.domian.entity.NoticeBGEntity;
import com.madiot.bookstore.domian.vo.NoticeVo;
import com.madiot.bookstore.mapper.NoticeBGMapper;
import com.madiot.bookstore.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
@Service
public class NoticeService implements INoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Resource
    private NoticeBGMapper noticeBGMapper;


    public List<NoticeVo> getNotices(int count) {
        List<NoticeVo> notices = new ArrayList<NoticeVo>();
        NoticeVo noticeVo = new NoticeVo();
        noticeVo.setImgPath("notice/image?name=map1.jpg");
        noticeVo.setAlt("puss in boots1");
        noticeVo.setTitle("puss in boots1");
        notices.add(noticeVo);
        return notices;
    }

    public NoticeBGEntity getNoticeBg() {
        NoticeBGEntity entity = new NoticeBGEntity();
        entity.setHeight(160);
        entity.setWidth(450);
        entity.setPositionX(470);
        entity.setPositionY(35);
        entity.setBackgroundPath("resources/other/images/templatemo_header_bg.jpg");
        return entity;
    }
}
