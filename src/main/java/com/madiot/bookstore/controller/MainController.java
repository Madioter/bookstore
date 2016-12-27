package com.madiot.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by julian on 16/12/25.
 */
@RequestMapping("/main")
@Controller
public class MainController {

    @RequestMapping("/index")
    public String index(){
        return "/resources/other/index.html";
    }
}
