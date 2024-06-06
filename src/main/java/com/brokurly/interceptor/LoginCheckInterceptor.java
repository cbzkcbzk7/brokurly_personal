package com.brokurly.interceptor;

import com.brokurly.utils.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * packageName    : com.brokurly.interceptor
 * fileName       : LoginCheckInterceptor
 * author         : Sora
 * date           : 2024-03-02
 * description    : 로그인 여부
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024-03-02        Sora       최초 생성
 */
@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{

        String reqURI = req.getRequestURI();
        log.info("[interceptor] = {}", reqURI);
        HttpSession session = req.getSession(false);

        // 1. 세션 값을 확인한다
        if(session == null || session.getAttribute(SessionConst.LOGIN_MEMBER) == null){
            // 2. 세션 없을 시 : 로그인 되지 않음
            //  2-1. redirect 로그인 화면
            log.info("[미인증 사용자]");
            res.sendRedirect("/member/login?redirectURL="+reqURI);
            return false;
        }
        // 3. 로그인 되었을 때
        return true;
    }
}
