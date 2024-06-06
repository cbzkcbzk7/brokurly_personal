package com.brokurly.controller;

import com.brokurly.service.SmsRestService;
import com.brokurly.utils.MailTempKey;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.IntStream;
@Slf4j
@RestController
@RequestMapping("/sms")
public class SmsRestController {

    @Autowired
    SmsRestService smsRestService;

    @PostMapping("/telNoCheck")
    @ResponseBody
    public String sendSMSSignup(@RequestParam(value="telNo") String telNo){

        // 랜덤 문자열을 생성해서 mailKey에 넣기
        String smsNum = new MailTempKey().getKey();

      //  smsRestService.certifiedPhoneNumber(telNo, smsNum);

        log.info("smsNum : {}", smsNum);
        return smsNum;
    }
}
