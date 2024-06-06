package com.brokurly.repository.mypage;

import com.brokurly.entity.mypage.ShippingLocation;
import com.brokurly.entity.mypage.ShippingLocationAndShoppingLocationChangeLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShippingLocationDao {
    // CREATE
    int insert(ShippingLocation shippingLocation);

    // READ
    List<ShippingLocation> selectAll();
    List<ShippingLocationAndShoppingLocationChangeLog> selectByCustomer(String custId);
    ShippingLocation selectByShipLocaId(String shipLocaId);
    int countAll();

    // UPDATE
    int updateByShipLocaId(ShippingLocation shippingLocation);

    // DELETE
    int deleteAll();
}
