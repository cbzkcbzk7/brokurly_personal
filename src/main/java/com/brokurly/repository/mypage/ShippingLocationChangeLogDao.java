package com.brokurly.repository.mypage;

import com.brokurly.entity.mypage.ShippingLocation;
import com.brokurly.entity.mypage.ShippingLocationChangeLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShippingLocationChangeLogDao {
    // CREATE
    int insert(ShippingLocationChangeLog shippingLocationChangeLog);

    // READ
    List<ShippingLocationChangeLog> selectAll();
    int countAll();

    // UPDATE

    // DELETE
    int deleteAll();
}
