package com.brokurly.controller;

import com.brokurly.entity.Validation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/valid")
public class ValidationTestController {

    @GetMapping
    public String test() {
        return "validation";
    }

    @PostMapping
    public String postTest(@ModelAttribute @Valid Validation validation, BindingResult bindingResult) {
        log.info("validation = {}", validation);
        log.info("bindingResult = {}", bindingResult);

        for (ObjectError error : bindingResult.getAllErrors()) {
            log.info("error : {}", error);
        }

        return "validation-result";
    }
}
