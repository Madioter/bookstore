package com.madiot.bookstore.service;

import com.madiot.bookstore.common.PageBean;
import com.madiot.bookstore.domain.entity.BookDO;
import com.madiot.bookstore.domain.vo.BookVO;
import com.madiot.bookstore.mapper.BestSaleMapper;
import com.madiot.bookstore.mapper.BookMapper;
import com.madiot.bookstore.mapper.NewBookMapper;
import com.madiot.bookstore.mapper.RecommendedMapper;
import org.apache.http.client.utils.DateUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by julian on 17/1/1.
 */
@Service
public class BookService implements IBookService {

    @Resource
    private NewBookMapper newBookMapper;

    @Resource
    private BestSaleMapper bestSaleMapper;

    @Resource
    private RecommendedMapper recommendedMapper;

    @Resource
    private BookMapper bookMapper;

    public List<BookVO> getNewBooks() {
        List<BookVO> books = new ArrayList<BookVO>();
        List<BookDO> bookEntities = newBookMapper.selectByCondition(new PageBean<BookDO>(1, 5));
        for (BookDO entity : bookEntities) {
            BookVO bookVo = convert(entity);
            books.add(bookVo);
        }
        return books;
    }

    public BookVO convert(BookDO entity) {
        BookVO bookVo = new BookVO();
        bookVo.setTitle(entity.getTitle());
        bookVo.setAuthor(entity.getAuthor());
        BigDecimal cost = BigDecimal.valueOf(entity.getCost());
        cost.setScale(2);
        bookVo.setCost(cost.toString());
        bookVo.setCoverPath("book/cover?coverPath=" + entity.getCoverPath());
        bookVo.setIsbn(entity.getIsbn());
        bookVo.setDescription(entity.getDescription());
        bookVo.setPages(entity.getPages());
        bookVo.setPress(entity.getPress());
        bookVo.setPublicationDate(DateUtils.formatDate(entity.getPublicationDate(), "yyyy年MM月dd日"));
        bookVo.setId(entity.getId());
        bookVo.setLink(entity.getLink());
        return bookVo;
    }

    public List<BookVO> getBestSaleBooks() {
        List<BookVO> books = new ArrayList<BookVO>();
        List<BookDO> bookEntities = bestSaleMapper.selectByCondition(new PageBean<BookDO>(1, 5));
        for (BookDO entity : bookEntities) {
            BookVO bookVo = convert(entity);
            books.add(bookVo);
        }
        return books;
    }

    public List<BookVO> getRecommendedBook() {
        List<BookVO> books = new ArrayList<BookVO>();
        List<BookDO> bookEntities = recommendedMapper.selectByCondition(new PageBean<BookDO>(1, 5));
        for (BookDO entity : bookEntities) {
            BookVO bookVo = convert(entity);
            if(bookVo.getDescription().length() > 100) {
                bookVo.setDescription(bookVo.getDescription().substring(0, 90) + "...");
            }
            books.add(bookVo);
        }
        return books;
    }

    public void save(BookDO book) {

    }

    public void delete(String ids) {
        String[] idArray = ids.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String idStr : idArray) {
            idList.add(Integer.valueOf(idStr));
        }
        bookMapper.deleteByBatch(idList);
    }

    @Override
    public void selectByCondition(PageBean<BookVO> pageBean) {

    }
}
