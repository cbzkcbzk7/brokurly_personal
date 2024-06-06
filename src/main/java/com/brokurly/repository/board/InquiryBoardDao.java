package com.brokurly.repository.board;

import com.brokurly.entity.board.Inquiry;
import com.brokurly.entity.board.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InquiryBoardDao {
    List<Inquiry> selectOneCustId(@Param("custId") String custId);

}