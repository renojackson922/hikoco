package org.silkdog.maven.hikoco.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthHasSessionInterceptor extends HandlerInterceptorAdapter {
    /**
     *  이미 로그인 햇을 경우 로그인 창으로 이동하지 못하게 인터셉트 처리.
     * */
    @Override
    public boolean preHandle(HttpServletRequest req,
                             HttpServletResponse resp,
                             Object handler) throws Exception{
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("auth") == null){
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
//            resp.sendRedirect("/login");
            return true;
        }else {
            resp.sendRedirect("/");
            return false;
        }
    }
}
