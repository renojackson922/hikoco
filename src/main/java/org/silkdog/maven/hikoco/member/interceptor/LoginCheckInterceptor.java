package org.silkdog.maven.hikoco.member.interceptor;

import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.web.portlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws IOException {
        HttpSession session = req.getSession(false);

        if(session == null){
            resp.sendRedirect("/login");
            return false;
        }

        MemberVO member = (MemberVO)session.getAttribute("member");

        if(member == null){
            resp.sendRedirect("/login");
            return false;
        }

        return true;
    }
}
