package com.brokurly.repository.board;

import com.brokurly.entity.board.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeBoardDao {
    List<Notice> selectAllPages();
    Notice selectBoardDetail(int bno);
//    bno가 null 이면??
//    List<Notice> selectPage(Integer bno);
    List<Notice> selectPage(@Param("start") int start, @Param("limit") int limit);
    Notice selectMax();
    Notice selectMin();
}