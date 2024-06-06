package com.brokurly.repository.mypage;

import com.brokurly.dto.mypage.PointLogUsageDto;
import com.brokurly.dto.mypage.PointLogEarningDto;
import com.brokurly.dto.mypage.PointLogExpDto;
import com.brokurly.entity.mypage.PointAndPointLog;
import com.brokurly.entity.mypage.PointLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PointLogDao {
    // CREATE
    int insert(PointLog pointLog);

    // READ
    List<PointLog> selectAll();
    List<PointLog> selectUsageByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    int countUsageByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    List<PointLog> selectExpByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    int countExpByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    List<PointLog> selectEarningByCustomer(String custId);
    List<PointAndPointLog> selectEarningByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    int countEarningByCustomerAndPeriod(@Param("custId") String custId, @Param("period") Integer period);
    int countAll();

    // UPDATE 없음

    // DELETE
    void deleteAll();
    void deleteByPointNo(Integer pointNo);
}
