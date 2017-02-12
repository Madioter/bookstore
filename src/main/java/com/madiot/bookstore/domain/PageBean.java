package com.madiot.bookstore.domain;

import java.util.List;
import java.util.Map;

/**
 * 分页对象
 * Created by julian on 17/1/1.
 */
public class PageBean<T> {

    /**
     * 起始条数
     */
    private int start;

    /**
     * 每页条数
     */
    private int limit;

    /**
     * 查询条件
     */
    private Map<String, Object> condition;

    /**
     * 查询结果
     */
    private List<T> rows;

    /**
     * 总数
     */
    private int total;

    public PageBean(int pageSize, int pageNum) {
        this.start = pageSize * (pageNum - 1);
        this.limit = pageSize;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
