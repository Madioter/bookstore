package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.NoticeBGEntity;
import com.madiot.bookstore.domain.entity.NoticeEntity;
import com.madiot.bookstore.domain.vo.NoticeVo;
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
        PageBean<NoticeEntity> pageBean = new PageBean<NoticeEntity>(count,1);
        List<NoticeEntity> noticeEntities = noticeMapper.selectByCondition(pageBean);
        List<NoticeVo> notices = convert(noticeEntities);
        return notices;
    }

    private List<NoticeVo> convert(List<NoticeEntity> noticeEntities) {
        List<NoticeVo> notices = new ArrayList<NoticeVo>();
        for (NoticeEntity entity : noticeEntities) {
            NoticeVo noticeVo = new NoticeVo();
            noticeVo.setAlt(entity.getAlt());
            noticeVo.setLink(entity.getLink());
            noticeVo.setImgPath("notice/image?name=" + entity.getImgPath());
            noticeVo.setTitle(entity.getTitle());
            notices.add(noticeVo);
        }
        return notices;
    }

    public NoticeBGEntity getNoticeBg() {
        return noticeBGMapper.getUsed();
    }
}
