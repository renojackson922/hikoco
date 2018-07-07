package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
//@RequestMapping("/auth/login")
public class LoginController {
    @Autowired
    private MemberDAO memberDAO;

//    @RequestMapping(method=RequestMethod.POST)
//    public String login(@Valid LoginCommand loginCommand, Errors errors, HttpSession session){
//        if(errors.hasErrors()){
//            return;
//        }
//        try{
//            Auth auth = authentication.authenticate(
//                    loginCommand.getEmail(), loginCommand.getPassword();
//            )
//            session.setAttribute("auth", auth);
//            return "redirect:/";
//        }catch(AuthenticationException e){
//            errors.reject("invalidIdOrPassword");
//            return;
//        }
//    }

    /* ======================================================== */
    /* ======================= 로그인 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String login(@RequestParam("hic_email") String id, @RequestParam("hic_pw") String pw, HttpSession session){
        System.out.println(id + " " + pw);
        MemberVO mdto = memberDAO.login(id, pw);
        if(mdto == null){
            System.out.println("No such userId exists.");
            return("redirect:/");
        }else{
            session.setAttribute("userid", mdto.getMem_userid());
            session.setAttribute("nickname", mdto.getMem_nickname());
            System.out.println("Logged in successfully.");
            return("redirect:/");
        }
    }

    @RequestMapping(value = "logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        if (session.getAttribute("userid") != null) {
            session.removeAttribute("userid");
            if (session.getAttribute("nickname") != null) session.removeAttribute("nickname");
        }
        session.invalidate();
        return "redirect:/";
    }

}
