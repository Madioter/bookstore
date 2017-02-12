package com.madiot.bookstore.controller;

import com.madiot.bookstore.domain.vo.BookVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by julian on 17/1/1.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @RequestMapping("/subPage")
    public ModelAndView subPage(int id){
        ModelAndView mv = new ModelAndView("/pages/content_subpage.jsp");
        BookVo bookVo = null;
        mv.addObject("book", bookVo);
        return mv;
    }

    @RequestMapping("/cover")
    public String cover(String coverPath){
        return "/resources/images/books/" + coverPath;
    }
}
