/**
 * @Title: IDictionaryService.java
 * @Package com.madiot.bookstore.service
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.service;

import com.madiot.bookstore.domain.entity.DictionaryDO;

/**
 * @ClassName: IDictionaryService
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public interface IDictionaryService {
    int delete(int id);

    int save(DictionaryDO dictionaryDO);
}
