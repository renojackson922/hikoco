package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/checkAccount")
/** ResponseBody 중요! jquery ajax 요청을 전송하는 방법. */
@ResponseBody
public class SBDuplicatedAccountController {
    @Autowired
    private SBMemberDAO SBMemberDAO;

    @PostMapping
    public int checkAccountGET(@RequestParam("username") String username){
        int accountSwitch = 0;
        if(SBMemberDAO.getInfoByUsername(username) != null){
            System.out.println("이미 계정이 있음!");
            accountSwitch = 1;
        }else{
            accountSwitch = 0;
            System.out.println("계정이 없음!!");
        }
//        model.addAttribute("accountSwitch", accountSwitch);
        return accountSwitch;

    }
}
