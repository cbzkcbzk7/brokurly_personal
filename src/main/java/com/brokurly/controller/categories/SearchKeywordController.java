package com.brokurly.controller.categories;

import com.brokurly.dto.categories.CategoryDto;
import com.brokurly.dto.categories.PriceFilterDto;
import com.brokurly.dto.goods.GoodsListDto;
import com.brokurly.service.categories.CategoryService;
import com.brokurly.service.goods.GoodsListService;
import com.brokurly.service.search.SearchKeywordService;
import com.brokurly.utils.PageHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class SearchKeywordController {

    private final CategoryService categoryService;
    private final GoodsListService goodsListService;
    private final SearchKeywordService searchKeywordService;



    @GetMapping("/search")
    public String searchPage(Model model, HttpSession session,
                             @RequestParam(required = false) String codeId,
                             @RequestParam(required = false) Integer page,
                             @RequestParam(required = false) String sword) throws UnsupportedEncodingException {

        List<CategoryDto> selectMain = (List<CategoryDto>) session.getAttribute("selectMain");
        model.addAttribute("selectMain",selectMain);

        List<GoodsListDto> goodsListDto;
        log.info("sword = {}", sword);
//        sword = URLEncoder.encode(sword, StandardCharsets.UTF_8);
//        log.info("sword = {}", sword);
        model.addAttribute("sword",sword);

        List<String> itemIdList = searchKeywordService.readItemIdList(sword);

        if (sword != null && !itemIdList.isEmpty() ) {
            page=1;
            int totalCnt = searchKeywordService.countGoodsListByitemIdList(itemIdList);
            PageHandler pageHandler = new PageHandler(totalCnt, page);
            model.addAttribute("totalCnt",totalCnt);
            model.addAttribute("pageHandler",pageHandler);

            goodsListDto =goodsListService.readGoodsListbyItemList(page, itemIdList);
            log.info("goodsListDto={}",goodsListDto);
            model.addAttribute("goodsListDto", goodsListDto);

            int[] criteria = searchKeywordService.criteriaForPriceFilter(itemIdList);
            model.addAttribute("criteria",criteria);
            log.info("criteria={}",criteria);

            return "search/search";
        } else {

            goodsListDto = new ArrayList<>(); // 빈 리스트 생성
            model.addAttribute("goodsListDto", goodsListDto);

            // 검색어가 주어지지 않은 경우 처리
            return "search/search";
        }
    }




    @PostMapping("/search")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> searchPageAjax(Model model,
                                                              @RequestParam(required = false) String sword,
                                                              @RequestParam(required = false) String codeId,
                                                              @RequestParam(required = false) String sortedType,
                                                              @RequestParam(required = false) Integer page,
                                                              @RequestParam(required = false) String filters,
                                                              @RequestParam(required = false) String PriceFilterNum) {
        log.info("sword={}", sword);
        log.info("sortedType = {}", sortedType);
        log.info("page={}", page);
        log.info("PriceFilterNum={}",PriceFilterNum);

        Map<String, Object> responseMap = new HashMap<>();

        List<String> itemIdList = searchKeywordService.readItemIdList(sword);

        PriceFilterDto filter = PriceFilterDto.builder()
                .priceFilterNum(PriceFilterNum)
                .build();
        log.info("filter={}",filter);

//        List<GoodsListDto> sortedGoodsList = goodsListService.sortGoodsList(codeId, page, sortedType);
//        log.info("sortedGoodsList={}",sortedGoodsList);
//        responseMap.put("sortedGoodsList", sortedGoodsList);
//        log.info("responseMap ={}", responseMap);

        int totalCnt = searchKeywordService.countGoodsListByFilterAnditemIdList(sortedType, filter, itemIdList);
        PageHandler pageHandler = new PageHandler(totalCnt, page);
        responseMap.put("pageHandler", pageHandler);
        responseMap.put("totalCnt",totalCnt);
        log.info("pageHandler={}",pageHandler);

        int[] criteria = searchKeywordService.criteriaForPriceFilter(itemIdList);
        responseMap.put("criteria", criteria);
        log.info("criteria={}", criteria);

        List<GoodsListDto> readGoodsLisByFilter = searchKeywordService.readGoodsLisByFilterAnditemIdList(page, sortedType, filter, itemIdList);
        log.info("readGoodsLisByFilter={}",readGoodsLisByFilter);
        responseMap.put("readGoodsLisByFilter",readGoodsLisByFilter);



        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }
}
