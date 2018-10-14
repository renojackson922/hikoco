package org.silkdog.maven.simpleboard.board.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/login")
public class SBLoginController {
    @Autowired
    private SBMemberDAO SBMemberDAO;

    private final static String REDIRECT_URL = "redirect:/board/c1/p1";

    @PostMapping
    public String loginPOST(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            RedirectAttributes redirectAttributes,
                            HttpSession httpSession){

//        ConcurrentHashMap<String, Object> map = new ConcurrentHashMap<>();
        String passwordEncrypted = DigestUtils.sha512Hex(password);
        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("username", username);
        hashmap.put("password", passwordEncrypted);

        if(SBMemberDAO.login(hashmap) == 1){
            System.out.println("로그인 성공");
            httpSession.setAttribute("session", username);
//            redirectAttributes.addAttribute("loginResult", "성공");
        }else{
            System.out.println("로그인 실패");
//            redirectAttributes.addAttribute("loginResult", "로그인에 실패했습니다. 계정정보를 확인해주세요.");
        }

        return REDIRECT_URL;
    }
}
