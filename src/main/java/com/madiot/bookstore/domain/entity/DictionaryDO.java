/**
 * @Title: Dictionary.java
 * @Package com.madiot.bookstore.domain.entity
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.domain.entity;

import java.util.List;

/**
 * @ClassName: Dictionary
 * @Description: 字典类
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public class DictionaryDO {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 父类别
     */
    private Integer parentId;

    /**
     * 当前类别信息
     */
    private String text;

    /**
     * 当前类别编码
     */
    private String code;

    /**
     * 是否删除
     */
    private Integer isDelete;

    /**
     * 子节点
     */
    private List<DictionaryDO> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public List<DictionaryDO> getChildren() {
        return children;
    }

    public void setChildren(List<DictionaryDO> children) {
        this.children = children;
    }
}
