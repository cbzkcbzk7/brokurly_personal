package com.brokurly.controller.products;

import com.brokurly.dto.categories.CategoryDto;
import com.brokurly.dto.seller.SellerAndLoginDto;
import com.brokurly.service.categories.CategoryService;
import com.brokurly.utils.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/seller")
public class  CategoryController {

    private final CategoryService categoryService;

    //생성자 추가해서 주입받기
    @Autowired
    public CategoryController(CategoryService categoryService){
        this.categoryService = categoryService;
    }

    @GetMapping("/productsCreate")
    public String readCategory(HttpServletResponse res, HttpServletRequest req, Model m) throws Exception {

        HttpSession session = req.getSession();
        SellerAndLoginDto nameDto = (SellerAndLoginDto) session.getAttribute(SessionConst.LOGIN_SELLER);
        if (nameDto != null) {
            List<CategoryDto> selectPrimary = categoryService.readPrimary();
            m.addAttribute("selectMain", selectPrimary);
            m.addAttribute("mode", "new");

            log.info("model={}", m);
            log.info("selectPrimary={}", selectPrimary);

            return "seller/productsCreate";

        } else {
            return "/seller/loginForm";
        }
    }

    @GetMapping ("/ajax")
    @ResponseBody
    public List<CategoryDto> test(@RequestParam String codeId){

        log.info("codeId컨트롤러임={}",codeId);

        List<CategoryDto> selectMiddle = categoryService.readMiddle(codeId);
        log.info("selectMiddle컨트롤러={}",selectMiddle);

//        log.info("middlemodel={}",model);

        return selectMiddle;
    }



}
