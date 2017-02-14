package com.madiot.bookstore.common;

import com.madiot.bookstore.domain.entity.DictionaryDO;
import com.madiot.bookstore.mapper.DictionaryMapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Yi.Wang2 on 2017/2/14.
 */
public class DictionaryHolder {

    private Map<Integer, DictionaryDO> dictionaryMap = new HashMap<Integer, DictionaryDO>();

    private List<DictionaryDO> topDictionaries = new ArrayList<DictionaryDO>();

    private DictionaryMapper dictionaryMapper = SpringContextUtils.getBeanByClass(DictionaryMapper.class);

    private static DictionaryHolder ourInstance = new DictionaryHolder();

    public static DictionaryHolder getInstance() {
        if (ourInstance == null) {
            synchronized (DictionaryHolder.class) {
                //未初始化，则初始instance变量
                if (ourInstance == null) {
                    ourInstance = new DictionaryHolder();
                }
            }
        }
        return ourInstance;
    }

    private DictionaryHolder() {
        List<DictionaryDO> dictionaryList = dictionaryMapper.selectAll();
        for (DictionaryDO dictionary : dictionaryList) {
            dictionaryMap.put(dictionary.getId(), dictionary);
            if (dictionary.getIsDelete() == 0 && dictionary.getParentId() == null) {
                setChildren(dictionary);
                topDictionaries.add(dictionary);
            }
        }
    }

    /**
     * 刷新单例数据
     */
    public void refresh() {
        synchronized (DictionaryHolder.class) {
            topDictionaries = new ArrayList<DictionaryDO>();
            dictionaryMap = new HashMap<Integer, DictionaryDO>();
            ourInstance = null;
        }
    }

    public DictionaryDO getById(Integer id) {
        return dictionaryMap.get(id);
    }

    public List<DictionaryDO> selectDictionary() {
        return topDictionaries;
    }

    public String getAllName(Integer id) {
        DictionaryDO dictionary = dictionaryMap.get(id);
        StringBuilder builder = new StringBuilder();
        while (dictionary != null && dictionary.getParentId() != null) {
            builder.insert(0, "/" + dictionary.getName());
            dictionary = dictionaryMap.get(dictionary.getParentId());
        }
        return builder.toString();
    }

    public List<DictionaryDO> getChildren(Integer id) {
        if (id == null) {
            return topDictionaries;
        }
        DictionaryDO dictionary = getById(id);
        return dictionary.getChildren();
    }

    public List getTree(Integer parentId) {
        DictionaryDO dictionary = getById(parentId);
        if (dictionary == null) {
            return topDictionaries;
        } else {
            return dictionary.getChildren();
        }
    }

    private void setChildren(DictionaryDO dictionary) {
        if (dictionary != null) {
            List<DictionaryDO> dictionaryList = getChildren(dictionary.getId());
            for (DictionaryDO item : dictionaryList) {
                setChildren(item);
            }
            dictionary.setChildren(dictionaryList);
        }
    }
}
