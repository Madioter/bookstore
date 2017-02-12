package com.madiot.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 广告通知信息
 * Created by julian on 16/12/31.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @RequestMapping("/image")
    public String image(String name) {
        return "/resources/images/notices/" + name;
    }
}
