package com.brokurly.repository.goods;

import com.brokurly.entity.goods.GoodsImage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsImageDao {
    int insert(GoodsImage goodsImage);

    GoodsImage selectByItemId(String itemId);   //대표이미지
    List<GoodsImage> selectListByItemId(String itemId); //상품 이미지(대표이미지 아닌거)
//    List<GoodsImage> searchListByItemId(String itemId); //대표이미지 리스트


    void deleteByImg(String string);

    String getThumbnailByItemId(String itemId);
}
