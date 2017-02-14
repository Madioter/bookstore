package com.madiot.bookstore.controller;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.BookDO;
import com.madiot.bookstore.domain.vo.BookVO;
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
        BookVO bookVo = null;
        mv.addObject("book", bookVo);
        return mv;
    }

    @RequestMapping("/cover")
    public String cover(String coverPath) {
        return "/resources/images/books/" + coverPath;
    }

    @RequestMapping("/bookPage")
    public String bookPage() {
        return "/pages/backstage/book/bookPage.jsp";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(BookDO book) {
        bookService.save(book);
        return "success";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String ids) {
        bookService.delete(ids);
        return "success";
    }

    @RequestMapping("/book-list")
    @ResponseBody
    public PageBean bookList(int pageSize, int row) {
        PageBean<BookVO> pageBean = new PageBean<BookVO>(pageSize, row);
        bookService.selectByCondition(pageBean);
        return pageBean;
    }
}
