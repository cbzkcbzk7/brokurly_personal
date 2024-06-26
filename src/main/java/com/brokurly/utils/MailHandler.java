package com.brokurly.utils;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

/**
 * packageName    : com.brokurly.utils
 * fileName       : MailHandler
 * author         : Sora
 * date           : 2024-03-03
 * description    : 메일 인증
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024-03-03        Sora       최초 생성
 */
public class MailHandler {
    private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;

    public MailHandler(JavaMailSender mailSender) throws MessagingException {
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    // 메일 제목
    public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }

    // 메일 내용
    public void setText(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }

    // 발송자
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
        messageHelper.setFrom(email, name);
    }

    //수신자
    public void setTo(String email) throws MessagingException{
        messageHelper.setTo(email);
    }

    public void addInline(String contentId, DataSource dataSource) throws MessagingException{
        messageHelper.addInline(contentId, dataSource);
    }

    // 보내기
    public void send(){
        mailSender.send(message);
    }
}

