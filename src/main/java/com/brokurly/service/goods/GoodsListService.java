package com.brokurly.service.goods;

import com.brokurly.dto.categories.PriceFilterDto;
import com.brokurly.dto.goods.GoodsListDto;
import com.brokurly.entity.goods.Goods;
import com.brokurly.repository.goods.GoodsDao;
import com.brokurly.repository.goods.GoodsImageDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class GoodsListService {
    private final GoodsDao goodsDao;
    private final GoodsImageDao goodsImageDao;

    private static final int GOODS_PER_PAGE = 9;

    public int countGoodsList(String cateCode){
       return goodsDao.countGoodsListByCateCode(cateCode);
    }

    public List<GoodsListDto> readGoodsList(String cateCode,int page){

        int start = GOODS_PER_PAGE*(page-1);
        List<Goods> goodsList = goodsDao.selectGoodsListByCateCode(cateCode, GOODS_PER_PAGE, start);
        List<GoodsListDto> goodsListDto = new ArrayList<>();

        for(Goods goods : goodsList){
            GoodsListDto dto = goods.makeGoodsList();
            String img = goodsImageDao.getThumbnailByItemId(dto.getItemId());
            dto.setImg(img);
            goodsListDto.add(dto);
        }

        return goodsListDto;
    }




    public List<GoodsListDto> sortGoodsList(String cateCode, int page, String sortedType){

//        List<Goods> goodsList= new ArrayList<>();


        int start = GOODS_PER_PAGE*(page-1);


        List<Goods> goodsList = goodsDao.sortGoodsList(cateCode, GOODS_PER_PAGE, start, sortedType);

//        if("0".equals(sortedtype)){
//         goodsList= goodsDao.sortGoodsListByRegDate(cateCode, GOODS_PER_PAGE, start);
//        }
//        else if("1".equals(sortedtype)){
//            goodsList = goodsDao.sortGoodsListBySellCnt(cateCode, GOODS_PER_PAGE, start);
//        }else if("2".equals(sortedtype)){
//            goodsList = goodsDao.sortGoodsListByLowPrice(cateCode, GOODS_PER_PAGE, start);
//        }else if("3".equals(sortedtype)){
//            goodsList = goodsDao.sortGoodsListByHighPrice(cateCode, GOODS_PER_PAGE, start);
//        }else if("4".equals(sortedtype)){
//            goodsList = goodsDao.sortGoodsListByDcRt(cateCode, GOODS_PER_PAGE, start);
//        }

        List<GoodsListDto> goodsListDto = new ArrayList<>();

        for(Goods goods : goodsList){
            GoodsListDto dto = goods.makeGoodsList();
            String img = goodsImageDao.getThumbnailByItemId(dto.getItemId());
            dto.setImg(img);
            goodsListDto.add(dto);
        }

        return goodsListDto;
    }


    public int[] criteriaForPriceFilter(String cateCode){

        Goods lowestPriceGoods = goodsDao.getLowestPriceGoods(cateCode);
        Goods highestPriceGoods = goodsDao.getHighestPriceGoods(cateCode);

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

    public List<GoodsListDto> readGoodsLisByFilter(String cateCode,
                                                   int page,
                                                   String sortedType,
                                                   PriceFilterDto filter){

        int[] criteria = criteriaForPriceFilter(cateCode);
        int start = GOODS_PER_PAGE*(page-1);

        filter = PriceFilterDto.builder()
                .priceFilterNum(filter.getPriceFilterNum())
                .shipType1(filter.getShipType1())
                .shipType2(filter.getShipType2())
                .price1(criteria[0])
                .price2(criteria[1])
                .price3(criteria[2])
                .build();

        log.info("filter={}",filter);

        List<Goods> goodsList = goodsDao.goodsListByPriceFilter(cateCode, GOODS_PER_PAGE, start, sortedType, filter);

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

    public int countGoodsListByPriceFilter(String cateCode,
                                           String sortedType,
                                           PriceFilterDto filter){

        int[] criteria = criteriaForPriceFilter(cateCode);
        filter = PriceFilterDto.builder()
                .priceFilterNum(filter.getPriceFilterNum())
                .shipType1(filter.getShipType1())
                .shipType2(filter.getShipType2())
                .price1(criteria[0])
                .price2(criteria[1])
                .price3(criteria[2])
                .build();

        log.info("filter={}",filter);

        return goodsDao.countGoodsListByPriceFilter(cateCode, sortedType, filter);
    }


    public List<GoodsListDto> readGoodsListbyItemList(int page,
                                                      List<String> itemId){

        int start = GOODS_PER_PAGE*(page-1);

        List<Goods> goodsList = goodsDao.selectGoodsListByitemIdList(GOODS_PER_PAGE, start, itemId);
        List<GoodsListDto> goodsListDto = new ArrayList<>();

        for(Goods goods : goodsList){
            GoodsListDto dto = goods.makeGoodsList();
            String img = goodsImageDao.getThumbnailByItemId(dto.getItemId());
            dto.setImg(img);
            goodsListDto.add(dto);
        }

        return goodsListDto;
    }



    public List<GoodsListDto> ReadGoodsListByRegDate (int page){

        int start = GOODS_PER_PAGE*(page-1);
        List<Goods> goodsList = goodsDao.GoodsListByRegDate(GOODS_PER_PAGE, start);
        List<GoodsListDto> goodsListDto = new ArrayList<>();

        for(Goods goods : goodsList){
            GoodsListDto dto = goods.makeGoodsList();
            String img = goodsImageDao.getThumbnailByItemId(dto.getItemId());
            dto.setImg(img);
            goodsListDto.add(dto);
        }

        return goodsListDto;
    }

    public int countGoodsListByRegDate(){
        return goodsDao.countGoodsListByRegDate();
    }

    public int[] criteriaForPriceFilterByRegDate(){

        Goods lowestPriceGoods = goodsDao.getLowestPriceGoodsByRegDate();
        Goods highestPriceGoods = goodsDao.getHighestPriceGoodsByRegDate();

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

}
