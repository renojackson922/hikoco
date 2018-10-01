package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;

@Controller
@CrossOrigin
@RequestMapping("/bot")
public class BotController {
    private final BoardDAO boardDAO;

    @Autowired
    public BotController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @GetMapping
    public String bot(){
        return "simpleboard/bot";
    }

    @PostMapping
    public String botPro(@RequestParam("times") int times, HttpServletRequest req){
        for(int i = 1; i <= times; i++){
            HashMap<String, Object> hashMap = new HashMap<>();

            String username = "야옹이" + i;
            String password = "didhddl" + i;
            String title = "야옹이테스트" + i;
            String detail = "야옹이테스트" + i + " 입니다";
            Date date = new Date();

            hashMap.put("username", username);
            hashMap.put("password", password);
            hashMap.put("category", 3);
            hashMap.put("title", title);
            hashMap.put("detail", detail);
            hashMap.put("writedate", new Timestamp(date.getTime()));
            hashMap.put("lastEditedDate", new Timestamp(date.getTime()));
            hashMap.put("writeip", req.getRemoteAddr());
            hashMap.put("lastEditedIp", req.getRemoteAddr());

            int res = boardDAO.doBot(hashMap);
        }

        return "redirect:bot";
    }
}
