package com.madiot.bookstore.controller;

import com.madiot.bookstore.domian.entity.NoticeBGEntity;
import com.madiot.bookstore.domian.vo.BookVo;
import com.madiot.bookstore.domian.vo.NoticeVo;
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
@RequestMapping("/main")
@Controller
public class MainController {

    @Autowired
    private INoticeService noticeService;

    @Autowired
    private IBookService bookService;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("/pages/index.jsp");
        NoticeBGEntity noticeBGEntity = noticeService.getNoticeBg();
        List<NoticeVo> notices = noticeService.getNotices(noticeBGEntity.getNoticeCount());
        List<BookVo> newBooks = bookService.getNewBooks();
        List<BookVo> bestSaleBooks = bookService.getBestSaleBooks();
        List<BookVo> recommendedBooks = bookService.getRecommendedBook();
        mv.addObject("notices", notices);
        mv.addObject("noticeBG", noticeBGEntity);
        mv.addObject("newBooks",newBooks);
        mv.addObject("bestSaleBooks",bestSaleBooks);
        mv.addObject("recommendedBooks",recommendedBooks);
        return mv;
    }
}
