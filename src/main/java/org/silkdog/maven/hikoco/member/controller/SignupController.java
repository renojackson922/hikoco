package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.validator.MemberValidator;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
@RequestMapping("/signup_new")
public class SignupController {
    @Autowired
    private MemberDAO memberDAO;

    /* static final : never going to be changed */
    private static final String SIGNUP_FORM = "signup_new";

    @GetMapping
    public String signupGET(@ModelAttribute("memberVO") MemberVO memberVO){
        return SIGNUP_FORM;
    }

    @PostMapping
    public String signupPOST(@ModelAttribute("memberVO") MemberVO memberVO,
                             final BindingResult bindingResult,
                             final RedirectAttributes redirectAttributes){

        new MemberValidator().validate(memberVO, bindingResult);
        if(bindingResult.hasErrors()){
//            redirectAttributes.addFlashAttribute()
            return SIGNUP_FORM;
        }
        memberDAO.insert(memberVO);

        return "redirect:/";
    }
}

/*
    HttpServletRequest req, HttpServletResponse resp, Model model,
    @RequestParam("g-recaptcha-response") String gresp,
    @RequestParam HashMap<String, Object> map) {
*/
