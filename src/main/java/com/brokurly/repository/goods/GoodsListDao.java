package com.brokurly.repository.goods;

import com.brokurly.entity.goods.GoodsList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsListDao {

    List<GoodsList> selectGoodsListbyCateCode(String cateCode);




}
