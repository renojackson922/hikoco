package org.silkdog.maven.hikoco.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest req,
                             HttpServletResponse resp,
                             Object handler) throws Exception{
        HttpSession session = req.getSession(false);
        if(session == null){
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            resp.sendRedirect("/login");
            return false;
        }
        if(session.getAttribute("auth") == null){
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            resp.sendRedirect("/login");
            return false;
        }
        return true;
    }
}
