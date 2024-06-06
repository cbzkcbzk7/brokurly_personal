package com.brokurly.repository.goods;


import com.brokurly.entity.goods.GoodsInquiryLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsInquiryLogDao {
    int insert(GoodsInquiryLog goodsInquiryLog);
    int update(GoodsInquiryLog goodsInquiryLog);
    List<GoodsInquiryLog> selectByItemId(String itemId);
    int delete(GoodsInquiryLog goodsInquiryLog);

}
