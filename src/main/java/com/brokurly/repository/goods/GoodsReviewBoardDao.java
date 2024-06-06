package com.brokurly.repository.goods;

import com.brokurly.entity.goods.GoodsReviewBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsReviewBoardDao {

    List<GoodsReviewBoard> selectByItemId(String itemId);

    List<GoodsReviewBoard> dateSort(String itemId);

    int likeCntUpdate(GoodsReviewBoard goodsReviewBoard);

    GoodsReviewBoard selectByCustId(String custId);

}
