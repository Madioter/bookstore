/**
 * @Title: DictionaryMapper.java
 * @Package com.madiot.bookstore.mapper
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.mapper;

import com.madiot.bookstore.domain.entity.DictionaryDO;

import java.util.List;

/**
 * @ClassName: DictionaryMapper
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public interface DictionaryMapper {

    public int insert(DictionaryDO entity);

    public int update(DictionaryDO entity);

    public List<DictionaryDO> selectAll();

    public int delete(int id);

    public int deleteByBatch(List<Integer> idList);
}
