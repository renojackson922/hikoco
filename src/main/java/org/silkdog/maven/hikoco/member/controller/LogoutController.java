package org.silkdog.maven.hikoco.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/shop/logout")
public class LogoutController {
    @GetMapping
    public String logout(HttpSession session) {
        if (session.getAttribute("userid") != null) {
            session.removeAttribute("userid");
            if (session.getAttribute("nickname") != null) session.removeAttribute("nickname");
        }
        session.invalidate();
        return "redirect:/shop";
    }
}
