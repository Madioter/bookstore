package com.madiot.bookstore.common;

import com.madiot.bookstore.domain.entity.DictionaryDO;
import com.madiot.bookstore.mapper.DictionaryMapper;
import org.springframework.util.CollectionUtils;

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
                setChildren(dictionary, dictionaryList);
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
            builder.insert(0, "/" + dictionary.getText());
            dictionary = dictionaryMap.get(dictionary.getParentId());
        }
        return builder.toString();
    }

    private List<DictionaryDO> getChildren(Integer id, List<DictionaryDO> dictionaryList) {
        if (id == null) {
            return null;
        }
        List<DictionaryDO> children = new ArrayList<DictionaryDO>();
        for (DictionaryDO item : dictionaryList) {
            if (item.getParentId() != null && item.getParentId().equals(id) && item.getIsDelete() == 0) {
                children.add(item);
            }
        }
        return children;
    }

    public List getTree(Integer parentId) {
        DictionaryDO dictionary = getById(parentId);
        if (dictionary == null) {
            return topDictionaries;
        } else {
            return dictionary.getChildren();
        }
    }

    private void setChildren(DictionaryDO dictionary, List<DictionaryDO> dictionaryList) {
        if (dictionary != null) {
            List<DictionaryDO> children = getChildren(dictionary.getId(), dictionaryList);
            if (!CollectionUtils.isEmpty(children)) {
                for (DictionaryDO item : children) {
                    setChildren(item, dictionaryList);
                }
                dictionary.setChildren(children);
            }
        }
    }
}
