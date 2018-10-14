package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.silkdog.maven.simpleboard.board.validator.SBMemberValidator;
import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/signup")
public class SBSignupController {
    @Autowired
    private SBMemberDAO sbMemberDAO;

    @GetMapping
    public String signupGET(@ModelAttribute("sbMemberVO") SBMemberVO sbMemberVO){
        return "/simpleboard/sb_signup";
    }

    @PostMapping
    public String signupPOST(@ModelAttribute("sbMemberVO") SBMemberVO sbMemberVO,
                             final BindingResult bindingResult){
        new SBMemberValidator(sbMemberDAO).validate(sbMemberVO, bindingResult);
        if(bindingResult.hasErrors()){
            return "/simpleboard/sb_signup";
        }

        sbMemberDAO.createAccount(sbMemberVO);

        return "redirect:/board";

    }
}



//    @PostMapping
//    public String signupPOST(@ModelAttribute("memberVO") MemberVO memberVO,
//                             final BindingResult bindingResult){
//        new MemberValidator(memberDAO).validate(memberVO, bindingResult);
//        if(bindingResult.hasErrors()){
//            return SIGNUP_FORM;
//        }
//        signupService.signupNewMember(memberVO);
//        //memberDAO.insert(memberVO);
//
//        return "redirect:/shop";
//    }