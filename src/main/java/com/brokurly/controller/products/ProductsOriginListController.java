package com.brokurly.controller.products;


import com.brokurly.dto.goods.GoodsByBsnsNoDto;
import com.brokurly.dto.goods.GoodsDto;
import com.brokurly.entity.goods.GoodsAnnouncement;
import com.brokurly.service.goods.GoodsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/seller")
public class ProductsOriginListController {

    private final GoodsService goodsService;

    @Autowired
    public ProductsOriginListController(GoodsService goodsService) {
        this.goodsService = goodsService;
    }



}
