/**
 * @Title: DictionaryController.java
 * @Package com.madiot.bookstore.controller
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.controller;

import com.madiot.bookstore.common.DictionaryHolder;
import com.madiot.bookstore.common.aop.MessageBody;
import com.madiot.bookstore.domain.entity.DictionaryDO;
import com.madiot.bookstore.service.IDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ClassName: DictionaryController
 * @Description: 书籍分类管理
 * @author Yi.Wang2
 * @date 2017/2/14
 */
@Controller
@RequestMapping("/dictionary")
public class DictionaryController {

    @Autowired
    private IDictionaryService dictionaryService;

    @RequestMapping("/dictionaryPage")
    public String bookPage() {
        return "/pages/backstage/dictionary/dictionaryPage.jsp";
    }

    @RequestMapping("/dictionaryList")
    @ResponseBody
    public List<DictionaryDO> dictionaryList() {
        return DictionaryHolder.getInstance().selectDictionary();
    }

    @RequestMapping("/getTree")
    @ResponseBody
    public List getTree(Integer parentId) {
        return DictionaryHolder.getInstance().getTree(parentId);
    }

    @RequestMapping("/deleteDictionary")
    @ResponseBody
    @MessageBody
    public String deleteDictionary(Integer id) {
        if (id == null) {
            return "0";
        } else {
            return String.valueOf(dictionaryService.delete(id));
        }
    }

    @RequestMapping("/saveDictionary")
    @ResponseBody
    @MessageBody
    public String saveDictionary(String text, String code, Integer parentId, Integer id) {
        DictionaryDO dictionaryDO = new DictionaryDO();
        dictionaryDO.setCode(code);
        dictionaryDO.setText(text);
        dictionaryDO.setParentId(parentId);
        dictionaryDO.setId(id);
        return String.valueOf(dictionaryService.save(dictionaryDO));
    }

    @RequestMapping("/refreshDictionary")
    @ResponseBody
    @MessageBody
    public String refreshDictionary() {
        DictionaryHolder.getInstance().refresh();
        return "success";
    }
}
