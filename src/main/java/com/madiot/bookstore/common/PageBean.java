package com.madiot.bookstore.common;

import com.igdata.tbox.domain.query.IQuery;

import java.util.List;

/**
 * 分页查询对象
 * Created by Yi.Wang2 on 2016/12/7.
 *
 * @param <T> the type parameter
 */
public class PageBean<T> {

    /**
     * 默认的起始条数为0
     */
    private int start = 0;

    /**
     * 每页的显示显示条数为10
     */
    private int limit = 10;

    /**
     * 保存查询结果集
     */
    private List<T> rows;

    /**
     * 保存查询结果总数
     */
    private int total;

    /**
     * 查询条件
     */
    private IQuery conditions;

    /**
     * 构造函数，构造分页对象
     *
     * @param page 当前页
     * @param rows 每页条数
     */
    public PageBean(Integer page, Integer rows) {
        if (page != null) {
            this.start = (page - 1) * rows;
        }
        if (rows != null) {
            this.limit = rows;
        }
    }

    /**
     * Gets start.
     *
     * @return the start
     */
    public int getStart() {
        return start;
    }

    /**
     * Sets start.
     *
     * @param start the start
     */
    public void setStart(int start) {
        this.start = start;
    }

    /**
     * Gets limit.
     *
     * @return the limit
     */
    public int getLimit() {
        return limit;
    }

    /**
     * Sets limit.
     *
     * @param limit the limit
     */
    public void setLimit(int limit) {
        this.limit = limit;
    }

    /**
     * Gets result list.
     *
     * @return the result list
     */
    public List<T> getRows() {
        return rows;
    }

    /**
     * Sets result list.
     *
     * @param rows the result list
     */
    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    /**
     * Gets total.
     *
     * @return the total
     */
    public int getTotal() {
        return total;
    }

    /**
     * Sets total.
     *
     * @param total the total
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * Gets conditions.
     *
     * @return the conditions
     */
    public IQuery getConditions() {
        return conditions;
    }

    /**
     * Sets conditions.
     *
     * @param conditions the conditions
     */
    public void setConditions(IQuery conditions) {
        this.conditions = conditions;
    }
}
