package com.brokurly.service.products;

import com.brokurly.dto.goods.*;
import com.brokurly.dto.search.SearchKeywordDto;
import com.brokurly.entity.goods.Goods;
import com.brokurly.entity.goods.GoodsAnnouncement;
import com.brokurly.entity.goods.GoodsImage;
import com.brokurly.entity.search.SearchKeyword;
import com.brokurly.repository.products.ProductsCreateDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class ProductsCreateService {

    private final ProductsCreateDao productsCreateDao;

    //생성자 추가해서 주입받기
    @Autowired
    public ProductsCreateService(ProductsCreateDao productsCreateDao) {
        this.productsCreateDao = productsCreateDao;
    }

    // 상품 table에 insert
    @Transactional
    public int write(GoodsDto goodsDto) {
        Goods goods = new Goods();        //Goods 도메인 만들기
        goods.changeStatus(goodsDto);     //goodsDto에 있는 값으로 goods의 상태를 변경한다.
        return productsCreateDao.insert(goods);  //goods insert
    }

    // 상품정보고시 table에 insert
    @Transactional
    public int writeAnnouncement(GoodsAnnouncementDto goodsAnnouncementDto) {
        GoodsAnnouncement goodsAnnouncement = new GoodsAnnouncement();
        goodsAnnouncement.changeStatus(goodsAnnouncementDto);
        return productsCreateDao.insertAnnouncement(goodsAnnouncement);
    }

    // SearchKeyword table에 insert
    @Transactional
    public void writeKeyword(SearchKeywordDto searchKeywordDto) {
        //1. keyword나누기
        String[] keywords = searchKeywordDto.getKeyword().split(",");
        String oneitemId = searchKeywordDto.getItemIdList();

        //2. keyword 존재여부 확인
        for (int i = 0; i < keywords.length; i++) {
            int result = productsCreateDao.selectKeywordExist(keywords[i]);
            log.info("result={}", result);
            if (result == 1) {
                //3-1. 존재O
                //4-1. item_id_list 가져와서 id 있는지 확인하기
                List<String> itemIdList = productsCreateDao.selectItemIdListByKeyword(keywords[i]);
                log.info("itemIdList={}", itemIdList);
                //idlist를 ,로 잘라서 하나씩 비교한다.
                String[] itemId = itemIdList.get(0).split(",");

                boolean shouldUpdate = true;  // 업데이트 여부를 판단하는 변수 추가

                for (int j = 0; j < itemId.length; j++) {
                    if (itemId[j].equals(oneitemId)) {
                        shouldUpdate = false;  // "itemId"가 이미 존재하면 업데이트하지 않음
                        break;  // 루프 종료
                    }
                }

                if (shouldUpdate) {
                    SearchKeywordDto searchKeywordDto1 = new SearchKeywordDto(keywords[i], oneitemId); //dto만들기
                    SearchKeyword searchKeyword = new SearchKeyword();  //도메인
                    searchKeyword.changeStatus(searchKeywordDto1);
                    productsCreateDao.updateItemIdList(searchKeyword);
                }

            } else {
                //3-2. 존재X 새로생성해서 추가
                SearchKeywordDto searchKeywordDto1 = new SearchKeywordDto(keywords[i], oneitemId); //dto만들기
                SearchKeyword searchKeyword = new SearchKeyword();  //도메인
                searchKeyword.changeStatus(searchKeywordDto1);
                productsCreateDao.insertSearchKeyword(searchKeyword);
            }
        }
    }

    //GoodsImage insert
    @Transactional
    public int writeGoodsImage(GoodsImageDto goodsImageDto) {
        GoodsImage goodsImage = new GoodsImage();
        goodsImage.changeStatus(goodsImageDto);
        return productsCreateDao.insertGoodsImage(goodsImage);
    }

    //상품 조회
    public GoodsDto searchGoods(String itemId) {
        Goods goods = productsCreateDao.selectByItemId(itemId);
        return goods.makeFullDto();
    }

    //고시정보 조회
    public GoodsAnnouncementDto searchAnnouncement(String itemId) {
        GoodsAnnouncement goodsAnnouncement = productsCreateDao.selectAnnouncementByItemId(itemId);
        return goodsAnnouncement.makeFullDto();
    }

    //searchKeyword 조회
    public List<String> searchKeyword(String itemId) {
        List<String> searchKeyword = productsCreateDao.selectKeywordByItemId(itemId);
        log.info("itemId={}", itemId);
        return searchKeyword;
    }

    //bsnsNo로 상품 조회
    @Transactional
    public List<GoodsByBsnsNoDto> readByBsnsNo(String bsnsNo) {
        //1. Goods 도메인 리스트를 받아온다.
        List<Goods> goodsList = productsCreateDao.selectByBsnsNo("4659877658");
//        log.info("goodsList={}", goodsList);

        //2. 비어있는 dto list 만들기
        List<GoodsByBsnsNoDto> dtoList = new ArrayList<>();
        //3. dto로 변환해서 list에 넣기
        for (Goods goods : goodsList) {
            dtoList.add(goods.toGoodsByBsnsNoDto("4659877658"));
        }
        log.info("dto={}", dtoList);

        return dtoList;
    }

    // 상품 업데이트
    @Transactional
    public void updateGoods(String itemId, GoodsUpdateDto goodsUpdateDto){
        //itemId로 찾기

        Goods goods = productsCreateDao.selectByItemId(itemId);
        log.info("goods={}",goods);
        log.info("과연..itemId={}",itemId);
        GoodsUpdateDto goodsChangeDto = goods.updateDto();
        log.info("goodsChangeDto={}",goodsChangeDto);
        log.info("goodsUpdateDto={}",goodsUpdateDto);

        goods.UpdateStatus(goodsUpdateDto);
        productsCreateDao.updateItem(goods);

    }

    // 고시정보 업데이트

    // searchKeyword 업데이트

    // 상품 삭제
    @Transactional
    public int removeByItemId(String ItemId) {
        return productsCreateDao.deleteByItemId(ItemId);
    }

}
