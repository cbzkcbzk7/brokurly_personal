package com.brokurly.service;


import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.util.HashMap;



@Service
@PropertySource("classpath:application.properties")
public class SmsRestService {
    DefaultMessageService messageService;

    @Value("${coolsms.apiKey}")
    private String api_key;

    @Value("${coolsms.apiSecret}")
    private String api_secret;

    public void certifiedPhoneNumber(String telNo, String smsNum){

        messageService =  NurigoApp.INSTANCE.initialize(api_key, api_secret, "https://api.coolsms.co.kr");

        Message message = new Message();
        message.setFrom(telNo);
        message.setTo(telNo);
        message.setText("["+smsNum+"] 브로컬리 인증번호를 입력해주세요.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));


    }
}
