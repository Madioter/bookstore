package com.madiot.bookstore.service;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.NoticeBGDO;
import com.madiot.bookstore.domain.entity.NoticeDO;
import com.madiot.bookstore.domain.vo.NoticeVO;
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


    public List<NoticeVO> getNotices(int count) {
        PageBean<NoticeDO> pageBean = new PageBean<NoticeDO>(count,1);
        List<NoticeDO> noticeEntities = noticeMapper.selectByCondition(pageBean);
        List<NoticeVO> notices = convert(noticeEntities);
        return notices;
    }

    private List<NoticeVO> convert(List<NoticeDO> noticeEntities) {
        List<NoticeVO> notices = new ArrayList<NoticeVO>();
        for (NoticeDO entity : noticeEntities) {
            NoticeVO noticeVo = new NoticeVO();
            noticeVo.setAlt(entity.getAlt());
            noticeVo.setLink(entity.getLink());
            noticeVo.setImgPath("notice/image?name=" + entity.getImgPath());
            noticeVo.setTitle(entity.getTitle());
            notices.add(noticeVo);
        }
        return notices;
    }

    public NoticeBGDO getNoticeBg() {
        return noticeBGMapper.getUsed();
    }
}
