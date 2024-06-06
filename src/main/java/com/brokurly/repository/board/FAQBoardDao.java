package com.brokurly.repository.board;

import com.brokurly.entity.board.FAQBoard;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FAQBoardDao {
    List<FAQBoard> selectFAQList(@Param("start") int start, @Param("limit") int limit);

    List<FAQBoard> selectAllFAQList();

    List<FAQBoard> selectSortedList(@Param("catecode") int catecode);

    FAQBoard selectMax();
}
