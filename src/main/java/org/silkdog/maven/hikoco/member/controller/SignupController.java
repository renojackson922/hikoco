package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.service.SignupService;
import org.silkdog.maven.hikoco.member.validator.MemberValidator;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@Controller
@ComponentScan
@RequestMapping("/shop/signup")
public class SignupController {
    @Autowired
    private MemberDAO memberDAO;

    /**
     * Service###impl의 @Service 어노테이션과, 컨트롤러의 ComponentScan의 합작.
     * ComponentScan이 필요한지는 추후 확인해야함.
     * */
    @Autowired
    private SignupService signupService;

    public void setSignupService(SignupService signupService) {
        this.signupService = signupService;
    }

    /* static final : never going to be changed */
    private static final String SIGNUP_FORM = "/hikoco/signup";

    @GetMapping
    public String signupGET(@ModelAttribute("memberVO") MemberVO memberVO){
        return SIGNUP_FORM;
    }

    @PostMapping
    public String signupPOST(@ModelAttribute("memberVO") MemberVO memberVO,
                             final BindingResult bindingResult){
        new MemberValidator(memberDAO).validate(memberVO, bindingResult);
        if(bindingResult.hasErrors()){
            return SIGNUP_FORM;
        }
        signupService.signupNewMember(memberVO);
        //memberDAO.insert(memberVO);

        return "redirect:/shop";
    }
}

/*
    HttpServletRequest req, HttpServletResponse resp, Model model,
    @RequestParam("g-recaptcha-response") String gresp,
    @RequestParam HashMap<String, Object> map) {
*/
