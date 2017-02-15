/**
 * @Title: DictionaryService.java
 * @Package com.madiot.bookstore.service
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.service;

import com.madiot.bookstore.common.DictionaryHolder;
import com.madiot.bookstore.domain.entity.DictionaryDO;
import com.madiot.bookstore.mapper.DictionaryMapper;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: DictionaryService
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
@Service
public class DictionaryService implements IDictionaryService {

    @Resource
    private DictionaryMapper dictionaryMapper;

    public int delete(int id) {
        List<Integer> ids = new ArrayList<Integer>();
        ids.add(id);
        DictionaryDO dictionary = DictionaryHolder.getInstance().getById(id);
        getAllChildren(dictionary, ids);
        return dictionaryMapper.deleteByBatch(ids);
    }

    @Override
    public int save(DictionaryDO dictionaryDO) {
        return dictionaryMapper.insert(dictionaryDO);
    }

    private void getAllChildren(DictionaryDO dictionary, List<Integer> ids) {
        List<DictionaryDO> children = DictionaryHolder.getInstance().getById(dictionary.getId()).getChildren();
        if (!CollectionUtils.isEmpty(children)) {
            for (DictionaryDO item : children) {
                getAllChildren(item, ids);
                ids.add(item.getId());
            }
        }
    }
}
