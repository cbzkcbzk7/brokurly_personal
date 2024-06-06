package com.brokurly.repository.mypage;

import com.brokurly.entity.mypage.WishList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface WishListDao {


    int insert(WishList wishList);
    int delete(WishList wishList);

    WishList selectByItemId(@Param("itemId") String itemId, @Param("custId") String custId);

}
