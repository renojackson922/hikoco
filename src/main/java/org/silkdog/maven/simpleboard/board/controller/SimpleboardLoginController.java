package org.silkdog.maven.simpleboard.board.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.silkdog.maven.simpleboard.board.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/login")
public class SimpleboardLoginController {
    @Autowired
    private MemberDAO memberDAO;

    private final static String REDIRECT_URL = "redirect:/board/c1/p1";

    @PostMapping
    public String loginPOST(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            Model model,
                            HttpSession httpSession){

//        ConcurrentHashMap<String, Object> map = new ConcurrentHashMap<>();
        String passwordEncrypted = DigestUtils.sha512Hex(password);
        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("username", username);
        hashmap.put("password", passwordEncrypted);

        if(memberDAO.login(hashmap) == 1){
            System.out.println("successfully login-ed");
            httpSession.setAttribute("session", username);
        }else{
            System.out.println("nah");
        }

        return REDIRECT_URL;
    }
}
