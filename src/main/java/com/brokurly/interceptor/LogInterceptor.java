package com.brokurly.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

/**
 * packageName    : com.brokurly.utils
 * fileName       : LogInterceptor
 * author         : Sora
 * date           : 2024-03-02
 * description    : API 로그 남기기
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024-03-02        Sora       최초 생성
 */
@Slf4j
public class LogInterceptor extends HandlerInterceptorAdapter {

    public static final String  LOG_ID = "log";

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
        String reqURI = req.getRequestURI();
        String uuid = UUID.randomUUID().toString();

        req.setAttribute(LOG_ID, uuid);

        log.info("REQUEST [{}][{}][{}]", uuid, reqURI, handler);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception{
        log.info("postHandler [{}]", modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception ex) throws Exception{
        String reqURI = req.getRequestURI();
        String uuid = (String)req.getAttribute(LOG_ID);
        log.info("RESPONSE [{}][{}][{}]", uuid, reqURI, handler);

        if(ex != null){
            log.error("afterCompletion err = {}", ex);
        }

    }
}
