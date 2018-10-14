package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

@Repository
public class SBLoginServiceImpl implements SBLoginService {
    @Autowired
    private SBMemberDAO sbMemberDAO;

    @Override
    public void checkSession(HttpSession httpSession, Model model) {
        if(httpSession.getAttribute("session") == null || httpSession.getAttribute("session").equals("")){
            System.out.println("세션이 없음!");
        }else{
            model.addAttribute("userinfo", sbMemberDAO.getInfoByUsername((String)httpSession.getAttribute("session")));
        }
    }

    @Override
    public void logout(HttpSession httpSession, SessionStatus sessionStatus, Model model) {
        sessionStatus.setComplete();
        httpSession.removeAttribute("session");
        httpSession.invalidate();
        System.out.println("세션 제거 완료!");
    }
}
