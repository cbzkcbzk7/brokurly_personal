package com.brokurly.repository.mypage;

import com.brokurly.entity.mypage.WishList;
import com.brokurly.entity.mypage.WishListItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WishListItemDao {
    List<WishListItem> searchByCustId(String custId);
    int insert(WishListItem wishListItem);
    int delete(WishListItem wishListItem);

}
