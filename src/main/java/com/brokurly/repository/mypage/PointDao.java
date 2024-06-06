package com.brokurly.repository.mypage;

import com.brokurly.entity.mypage.Point;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PointDao {
    // CREATE
    int insert(Point point);

    // READ
    List<Point> selectByExpirDt(String custId);
    List<Point> selectByCustomer(String custId);
    Point selectByPointNo(Integer pointNo);
    List<Point> selectToBeExpired(String custId);
    List<Point> selectExpiredByCustomer(String custId);
    int countAll();

    // UPDATE
    int updatePointAmtByPointNo(@Param("amt") Integer amt, @Param("pointNo") int pointNo);

    // DELETE
    void deleteAll();
    int deleteByPointNo(Integer pointNo);
}
