package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.service.SBLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/logout")
//@SessionAttributes("session")
public class SBLogoutController {
    @Autowired
    @Qualifier("SBLoginServiceImpl")
    private SBLoginService sbLoginService;

    @PostMapping
    public String logout(HttpSession httpSession, SessionStatus sessionStatus, Model model){
        sbLoginService.logout(httpSession, sessionStatus, model);
        return "redirect:/board/c1/p1";
    }
}
