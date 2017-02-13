package com.madiot.bookstore.controller;

import com.madiot.bookstore.domain.PageBean;
import com.madiot.bookstore.domain.entity.BookEntity;
import com.madiot.bookstore.domain.vo.BookVo;
import com.madiot.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by julian on 17/1/1.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService bookService;

    @RequestMapping("/subPage")
    public ModelAndView subPage(int id) {
        ModelAndView mv = new ModelAndView("/pages/websit/content_subpage.jsp");
        BookVo bookVo = null;
        mv.addObject("book", bookVo);
        return mv;
    }

    @RequestMapping("/cover")
    public String cover(String coverPath) {
        return "/resources/images/books/" + coverPath;
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(BookEntity book) {
        bookService.save(book);
        return "success";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String ids) {
        bookService.delete(ids);
        return "success";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageBean<BookVo> getList(int pageSize, int row) {
        PageBean<BookVo> pageBean = new PageBean<BookVo>(pageSize, row);
        bookService.selectByCondition(pageBean);
        return pageBean;
    }
}
