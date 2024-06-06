package com.brokurly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login-check")
public class LoginCheckController {

    @GetMapping
    public String loginCheck(@RequestParam String redirectURI, Model model) {
        model.addAttribute("redirectURI", redirectURI);
        return "login-check";
    }
}
