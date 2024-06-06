package com.brokurly.repository.board;

import com.brokurly.entity.board.FAQCate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FAQCateDao {
    List<FAQCate> selectFAQCateList();
    FAQCate selectCate(@Param("catecode") int catecode);
}
