package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.authenticator.AuthenticationException;
import org.silkdog.maven.hikoco.member.authenticator.Authenticator;
import org.silkdog.maven.hikoco.member.authenticator.LoginCommandValidator;
import org.silkdog.maven.hikoco.member.vo.LoginCommandVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@ComponentScan
@RequestMapping("/shop/login")
public class LoginController {
    @Autowired
    private Authenticator authenticator;
    private static final String LOGIN_FORM = "/hikoco/login/login";

    /**
     * Service###impl의 @Service 어노테이션과, 컨트롤러의 ComponentScan의 합작.
     * ComponentScan이 필요한지는 추후 확인해야함.
     * */

    @GetMapping
    public String login(@ModelAttribute("loginCommandVO") LoginCommandVO loginCommandVO) {
        return "/hikoco/login/login";
    }

    @PostMapping
    public String loginPro(@Valid @ModelAttribute("loginCommandVO") LoginCommandVO loginCommandVO,
                        Errors errors,
                        HttpServletRequest req){
        if(errors.hasErrors()){
            return LOGIN_FORM;
        }
        try{
            Auth auth = authenticator.authenticate(loginCommandVO.getUserid(), loginCommandVO.getPassword());
            HttpSession session = req.getSession();
            session.setAttribute("auth", auth);
            return "redirect:/shop";
        }catch(AuthenticationException ae){
            errors.rejectValue("password","invalidUseridOrPassword");
            return LOGIN_FORM;
        }
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new LoginCommandValidator());
    }

    public void setAuthenticator(Authenticator authenticator) {
        this.authenticator = authenticator;
    }
}
