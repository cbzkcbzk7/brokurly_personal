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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class NewProductPageController {

    private final CategoryService categoryService;
    private final GoodsListService goodsListService;

    @GetMapping("/market-newproduct")
    public String searchPage(Model model, HttpSession session,
                             @RequestParam(required = false) Integer page) {

        categoryService.readPrimary();
        List<CategoryDto> selectMain = categoryService.readPrimary();
        model.addAttribute("selectMain", selectMain);
        session.setAttribute("selectMain",selectMain);


        List<GoodsListDto> goodsListDto;
        page=1;


            int totalCnt = goodsListService.countGoodsListByRegDate();
            PageHandler pageHandler = new PageHandler(totalCnt, page);
            model.addAttribute("totalCnt",totalCnt);
            model.addAttribute("pageHandler",pageHandler);

            goodsListDto =goodsListService.ReadGoodsListByRegDate(page);
            log.info("goodsListDto={}",goodsListDto);
            model.addAttribute("goodsListDto", goodsListDto);

            int[] criteria = goodsListService.criteriaForPriceFilterByRegDate();
            model.addAttribute("criteria",criteria);
            log.info("criteria={}",criteria);

            return "categories/new-product";


        }


    @PostMapping("/market-newproduct")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> searchPageAjax(Model model,
                                                              @RequestParam(required = false) Integer page,
                                                              @RequestParam(required = false) String filters,
                                                              @RequestParam(required = false) String PriceFilterNum) {

        Map<String, Object> responseMap = new HashMap<>();


        PriceFilterDto filter = PriceFilterDto.builder()
                .priceFilterNum(PriceFilterNum)
                .build();
        log.info("filter={}",filter);

        List<GoodsListDto> goodsListDto =goodsListService.ReadGoodsListByRegDate(page);
        responseMap.put("goodsListDto", goodsListDto);



        int totalCnt = goodsListService.countGoodsListByRegDate();
        PageHandler pageHandler = new PageHandler(totalCnt, page);
        responseMap.put("pageHandler", pageHandler);
        responseMap.put("totalCnt",totalCnt);
        log.info("pageHandler={}",pageHandler);

        int[] criteria = goodsListService.criteriaForPriceFilterByRegDate();
        responseMap.put("criteria", criteria);
        log.info("criteria={}", criteria);



        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

}
