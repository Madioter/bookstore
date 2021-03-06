package com.madiot.bookstore.controller;

import com.madiot.bookstore.domain.entity.NoticeBGDO;
import com.madiot.bookstore.domain.vo.BookVO;
import com.madiot.bookstore.domain.vo.NoticeVO;
import com.madiot.bookstore.service.IBookService;
import com.madiot.bookstore.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by julian on 16/12/25.
 */
@Controller
public class MainController {

    @Autowired
    private INoticeService noticeService;

    @Autowired
    private IBookService bookService;

    @RequestMapping("/main-index")
    public ModelAndView mainIndex() {
        ModelAndView mv = new ModelAndView("/pages/websit/index.jsp");
        NoticeBGDO noticeBGEntity = noticeService.getNoticeBg();
        List<NoticeVO> notices = noticeService.getNotices(noticeBGEntity.getNoticeCount());
        List<BookVO> newBooks = bookService.getNewBooks();
        List<BookVO> bestSaleBooks = bookService.getBestSaleBooks();
        List<BookVO> recommendedBooks = bookService.getRecommendedBook();
        mv.addObject("notices", notices);
        mv.addObject("noticeBG", noticeBGEntity);
        mv.addObject("newBooks", newBooks);
        mv.addObject("bestSaleBooks", bestSaleBooks);
        mv.addObject("recommendedBooks", recommendedBooks);
        return mv;
    }

    @RequestMapping("/back-index")
    public ModelAndView backIndex() {
        ModelAndView mv = new ModelAndView("/pages/backstage/index.jsp");
        /*NoticeBGEntity noticeBGEntity = noticeService.getNoticeBg();
        List<NoticeVo> notices = noticeService.getNotices(noticeBGEntity.getNoticeCount());
        List<BookVo> newBooks = bookService.getNewBooks();
        List<BookVo> bestSaleBooks = bookService.getBestSaleBooks();
        List<BookVo> recommendedBooks = bookService.getRecommendedBook();
        mv.addObject("notices", notices);
        mv.addObject("noticeBG", noticeBGEntity);
        mv.addObject("newBooks", newBooks);
        mv.addObject("bestSaleBooks", bestSaleBooks);
        mv.addObject("recommendedBooks", recommendedBooks);*/
        return mv;
    }
}
