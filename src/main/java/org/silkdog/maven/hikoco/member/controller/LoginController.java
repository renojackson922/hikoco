package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/auth/login")
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

    @RequestMapping(method=RequestMethod.POST)
    public String login(@RequestParam("hic_email") String id, @RequestParam("hic_pw") String pw){
        memberDAO.login(id, pw);
        return "redirect:/";
    }

}
