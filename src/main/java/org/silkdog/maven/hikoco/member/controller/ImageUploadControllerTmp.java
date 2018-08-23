package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/img")
public class ImageUploadControllerTmp {
    @Autowired
    private MemberDAO memberDAO;

    @GetMapping
    public String imgGet(){
        return "img_test";
    }

    @PostMapping
    public String imgPost(@ModelAttribute("fileVO") FileVO fileVO){
        try{
            HashMap<String, Object> map = new HashMap<>();
            map.put("img", fileVO.getImgFile().getBytes());
            memberDAO.saveProfileImage(map);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/img";
    }
}
