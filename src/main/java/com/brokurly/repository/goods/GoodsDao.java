package com.brokurly.repository.goods;


import com.brokurly.dto.categories.PriceFilterDto;
import com.brokurly.entity.cart.Cart;
import com.brokurly.entity.goods.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GoodsDao {

    // CREATE

    int insert(Goods goods); //상품 추가

    int addCart(Cart cart); //장바구니 상품 추가


    // READ
    Goods selectByItemId(String itemId);  //optional 값이 없는 null을 optional로 감싸서 전달

    // UPDATE
    int update(Goods goods);

    // DELTE
    int deleteByItemId(String itemId);


    List<Goods> selectGoodsListByCateCode(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                          @Param("start") int start);


    int countGoodsListByCateCode(String cateCode);

    List<Goods> sortGoodsList(@Param("cateCode") String cateCode, @Param("limit") int limit,
                              @Param("start") int start, @Param("sortedType") String sortedType);

    List<Goods> sortGoodsListByRegDate(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                       @Param("start") int start);

    List<Goods> sortGoodsListByLowPrice(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                        @Param("start") int start);

    List<Goods> sortGoodsListByHighPrice(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                         @Param("start") int start);

    List<Goods> sortGoodsListBySellCnt(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                       @Param("start") int start);

    List<Goods> sortGoodsListByDcRt(@Param("cateCode") String cateCode, @Param("limit") int limit,
                                    @Param("start") int start);

    List<Goods> selectGoodsListByCateCode(String cateCode);

    Goods getLowestPriceGoods(String cateCode);
    Goods getHighestPriceGoods(String cateCode);

    List<Goods> goodsListByPriceFilter(@Param("cateCode") String cateCode,
                                       @Param("limit") int limit,
                                       @Param("start") int start,
                                       @Param("sortedType") String sortedType,
                                       @Param("filter") PriceFilterDto filter);
    int countGoodsListByPriceFilter(@Param("cateCode") String cateCode,
                                    @Param("sortedType") String sortedType,
                                    @Param("filter") PriceFilterDto filter);

    List<Goods> selectGoodsListByitemIdList(@Param("limit") int limit,
                                            @Param("start") int start,
                                            @Param("itemId") List<String> itemId);
    Goods getLowestPriceGoodsByitemIdList(@Param("itemId") List<String> itemId);
    Goods getHighestPriceGoodsByitemIdList(@Param("itemId") List<String> itemId);

    int countGoodsListByitemIdList(@Param("itemId") List<String> itemId);

    List<Goods> goodsListByIdListAndFilter(
                                       @Param("limit") int limit,
                                       @Param("start") int start,
                                       @Param("sortedType") String sortedType,
                                       @Param("filter") PriceFilterDto filter,
                                       @Param("itemId") List<String> itemId);

    int countGoodsListByIdListAndFilter(
                                    @Param("sortedType") String sortedType,
                                    @Param("filter") PriceFilterDto filter,
                                    @Param("itemId") List<String> itemId);


    List<Goods> GoodsListByRegDate(@Param("limit") int limit,
                                   @Param("start") int start);
    int countGoodsListByRegDate ();

    Goods getLowestPriceGoodsByRegDate();
    Goods getHighestPriceGoodsByRegDate();

}


