package com.brokurly.service.search;

import com.brokurly.dto.categories.PriceFilterDto;
import com.brokurly.dto.goods.GoodsListDto;
import com.brokurly.entity.goods.Goods;
import com.brokurly.repository.goods.GoodsDao;
import com.brokurly.repository.goods.GoodsImageDao;
import com.brokurly.repository.search.SearchKeywordDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class SearchKeywordService {

    private final SearchKeywordDao searchKeywordDao;
    private final GoodsDao goodsDao;
    private final GoodsImageDao goodsImageDao;

    private static final int GOODS_PER_PAGE = 9;

    public List<String> readItemIdList(String sword){

        List<String> itemIdList=searchKeywordDao.selectItemIdListByKeyword(sword);
        List<String> itemIdList2 = new ArrayList<>();
        if(itemIdList!=null) {
            for(String itemId : itemIdList) {
                //itemIdList2 = Arrays.asList(itemId.split(","));
                 itemIdList2.addAll(Arrays.asList(itemId.split(",")));
            }
        }
        return itemIdList2;
    }

    public int[] criteriaForPriceFilter(List<String> itemId){

        Goods lowestPriceGoods = goodsDao.getLowestPriceGoodsByitemIdList(itemId);
        Goods highestPriceGoods = goodsDao.getHighestPriceGoodsByitemIdList(itemId);

        GoodsListDto lowestPriceDto = lowestPriceGoods.makeGoodsList();
        GoodsListDto highestPriceDto = highestPriceGoods.makeGoodsList();

        int lowestPrice = lowestPriceDto.getDisPrice();
        int highestPrice = highestPriceDto.getDisPrice();

        int interval = (highestPrice - lowestPrice)/4;

        int[] criteria = new int[3];
        for (int i = 0; i < 3; i++) {
            criteria[i] = (lowestPrice + interval * (i + 1))/100*100;
        }
        return criteria;
    }

    public int countGoodsListByitemIdList(List<String> itemId){
        return goodsDao.countGoodsListByitemIdList(itemId);
    }

    public List<GoodsListDto> readGoodsLisByFilterAnditemIdList(int page,
                                                   String sortedType,
                                                   PriceFilterDto filter,
                                                   List<String> itemId){

        int[] criteria = criteriaForPriceFilter(itemId);
        int start = GOODS_PER_PAGE*(page-1);

        filter = PriceFilterDto.builder()
                .priceFilterNum(filter.getPriceFilterNum())
                .price1(criteria[0])
                .price2(criteria[1])
                .price3(criteria[2])
                .build();

        log.info("filter={}",filter);

        List<Goods> goodsList = goodsDao.goodsListByIdListAndFilter(GOODS_PER_PAGE, start, sortedType, filter, itemId);
        List<GoodsListDto> goodsListDto = new ArrayList<>();

        for(Goods goods : goodsList){
            GoodsListDto dto = goods.makeGoodsList();
            String img = goodsImageDao.getThumbnailByItemId(dto.getItemId());
            dto.setImg(img);
            goodsListDto.add(dto);
        }

        log.info("goodsListDto={}",goodsListDto);

        return goodsListDto;

    }

    public int countGoodsListByFilterAnditemIdList(
                                           String sortedType,
                                           PriceFilterDto filter,
                                           List<String> itemId){

        int[] criteria = criteriaForPriceFilter(itemId);
        filter = PriceFilterDto.builder()
                .priceFilterNum(filter.getPriceFilterNum())
                .price1(criteria[0])
                .price2(criteria[1])
                .price3(criteria[2])
                .build();

        log.info("filter={}",filter);

        return goodsDao.countGoodsListByIdListAndFilter(sortedType,filter,itemId);
    }





}
