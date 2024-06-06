package com.brokurly.controller.categories;

import com.brokurly.dto.categories.CategoryDto;
import com.brokurly.dto.categories.PriceFilterDto;
import com.brokurly.dto.goods.GoodsListDto;
import com.brokurly.service.categories.CategoryService;
import com.brokurly.service.goods.GoodsListService;
import com.brokurly.utils.PageHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/categories")
public class BestPageController {

    private final CategoryService categoryService;
    private final GoodsListService goodsListService;

    @GetMapping("/header")
    public String readCategory(Model m) throws Exception {

        categoryService.readPrimary();

        List<CategoryDto> selectMain = categoryService.readPrimary();
        m.addAttribute("selectMain", selectMain);


        return "include/header";
    }

    @GetMapping("/best-page")
    public String bestpage(Model m) throws Exception {
//        CategoryDto categoryDto = new CategoryDto();

        List<CategoryDto> selectMain = categoryService.readPrimary();
        m.addAttribute("selectMain", selectMain);

        return "categories/best-page";
    }

    @GetMapping("/{codeId}")
    public String categoryPage(HttpSession session, Model model, @PathVariable String codeId,
                               @RequestParam(required = false) String sortedType,
                               @RequestParam(required = false) Integer page,
                               @RequestParam(required = false) String filters) throws Exception {

        log.info("filters = {}", filters);

        //대분류 카테고리이름

        List<CategoryDto> selectMain = (List<CategoryDto>) session.getAttribute("selectMain");
        model.addAttribute("selectMain",selectMain);


        //페이징
        int totalCnt = goodsListService.countGoodsList(codeId);
        PageHandler pageHandler = new PageHandler(totalCnt, page);

        //중분류 카테고리이름
        List<CategoryDto> categorydto = categoryService.findCategoryByPrimary(codeId.length() == 6 ? codeId.substring(0, 3) : codeId);

        // 카테고리별 & 분류 타입에 따라 상품 나열하기
        List<GoodsListDto> goodsListDto;
        if (page == null) page = 1;
        if (sortedType != null) {
            goodsListDto = goodsListService.sortGoodsList(codeId, page, sortedType);
        } else {
            goodsListDto = goodsListService.readGoodsList(codeId, page);
        }
        //가격 필터의 기준값들
        int[] criteria = goodsListService.criteriaForPriceFilter(codeId);


        model.addAttribute("codeId", codeId);
        model.addAttribute("sortedType", sortedType);

        model.addAttribute("categorydto", categorydto);
        model.addAttribute("goodsListDto", goodsListDto);
        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("pageHandler", pageHandler);
        model.addAttribute("criteria", criteria);

        return "categories/categories";
    }

    @PostMapping("/{codeId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> categoryPageAjax(Model model, @PathVariable String codeId,
                                                                @RequestParam(required = false) String sortedType,
                                                                @RequestParam(required = false) Integer page,
                                                                @RequestParam(required = false) String filters,
                                                                @RequestParam(required = false) String PriceFilterNum,
                                                                @RequestParam(required = false) String shipType1,
                                                                @RequestParam(required = false) String shipType2) {
        log.info("codeId = {}", codeId);
        log.info("sortedType = {}", sortedType);


        Map<String, Object> responseMap = new HashMap<>();

        PriceFilterDto filter = PriceFilterDto.builder()
                .shipType1(shipType1)
                .shipType2(shipType2)
                .priceFilterNum(PriceFilterNum)
                .build();
        log.info("filter={}",filter);

        List<GoodsListDto> sortedGoodsList = goodsListService.sortGoodsList(codeId, page, sortedType);
        responseMap.put("sortedGoodsList", sortedGoodsList);

        //페이징
        int totalCnt = goodsListService.countGoodsListByPriceFilter(codeId, sortedType, filter);
        PageHandler pageHandler = new PageHandler(totalCnt, page);
        responseMap.put("pageHandler", pageHandler);
        responseMap.put("totalCnt",totalCnt);
        log.info("totalCnt={}",totalCnt);
        log.info("pageHandler={}",pageHandler);

        //가격 필터 기준 값
        int[] criteria = goodsListService.criteriaForPriceFilter(codeId);
        responseMap.put("criteria", criteria);

        // 필터적용한 상품리스트
        List<GoodsListDto> readGoodsLisByFilter = goodsListService.readGoodsLisByFilter(codeId, page, sortedType, filter);
        log.info("readGoodsLisByFilter={}",readGoodsLisByFilter);
        responseMap.put("readGoodsLisByFilter",readGoodsLisByFilter);

        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }
}