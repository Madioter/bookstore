/**
 * @Title: Dictionary.java
 * @Package com.madiot.bookstore.domain.entity
 * @Description: TODO
 * @author Yi.Wang2
 * @date 2017/2/14
 * @version
 */
package com.madiot.bookstore.domain.entity;

/**
 * @ClassName: Dictionary
 * @Description: 字典类
 * @author Yi.Wang2
 * @date 2017/2/14
 */
public class DictionaryDO {

    private Integer id;

    private Integer parent_id;

    private String value;

    private String code;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
