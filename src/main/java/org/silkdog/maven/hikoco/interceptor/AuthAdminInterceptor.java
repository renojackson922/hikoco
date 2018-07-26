package org.silkdog.maven.hikoco.interceptor;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthAdminInterceptor extends HandlerInterceptorAdapter {
    /** *
     *  SC_### 로 에러 페이지를 표시하는 것보다
     *  메인페이지로 리다이렉트 되는 것이 편의성 면에서 좀 더 좋을 것으로 생각함.
     */
    @Autowired
    private MemberDAO memberDAO;

    @Override
    public boolean preHandle(HttpServletRequest req,
                             HttpServletResponse resp,
                             Object handler) throws Exception{
        HttpSession session = req.getSession(false);

        /**
         *  Auth에 등급도 추가할 예정. DB에 한번 더 접근할 필요가 없어짐.
         */

        // tier를 선언하지 않으면 NullPointerException 오류 발생.
        String tier = "";
        try {
            Auth auth = (Auth) session.getAttribute("auth");
            tier = memberDAO.getFullMemberByUserid(auth.getUserid()).getTier();
        }catch(Exception e){
            e.printStackTrace();
        }

        /** 세션이 없을 때; 로그인 하지 않았을 때 */
        if(session == null){
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            resp.sendRedirect("/login");
            return false;
        } /** 뭔가 세션은 있는데 auth 속성이 없는 경우. 불법접근 */
        if(session.getAttribute("auth") == null){
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            resp.sendRedirect("/login");
            return false;
        } /** 티어가 아다만티움이 아닐 경우. 관리자 권한이 없음. */
        if(!tier.equals("아다만티움")){
            System.out.println("티어가 아다만티움이 아님!");
//            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            resp.sendRedirect("/");
        }
        return true;
    }
}
