package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.service.SignupService;
import org.silkdog.maven.hikoco.member.vo.FileVO;
import org.silkdog.maven.hikoco.member.vo.ProfileImageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Controller

public class showImageController {
    @Autowired
    private MemberDAO memberDAO;

    /** Component-scan 으로 빈을 검색하였다면, 별도로 applicationContext에 빈을 등록하거나,
     * @Resource 어노테이션에 name 옵션을 줄 필요가 없음. */
    /*
    @Resource
    private SignupService signupService;
*/

    @RequestMapping(value="/viewImage")
    public String view(){
        return "image_view";
    }

    @RequestMapping(value="/getByteImage")
    public ResponseEntity<byte[]> getByteImage() {
        HashMap<String, Object> map = memberDAO.getByteImage(1);
        byte[] imageContent = (byte[]) map.get("img");
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(imageContent, headers, HttpStatus.OK);
    }

    @RequestMapping(value="/imageDisplay", method=RequestMethod.GET)
    public void imageDisplay(@RequestParam("id") int id,
                             HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HashMap<String, Object> map = memberDAO.getByteImage(id);
        byte[] imageContent = (byte[]) map.get("img");

        resp.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        resp.getOutputStream().write(imageContent);
        resp.getOutputStream().close();
    }

    /*
    public void setSignupService(SignupService signupService) {
        this.signupService = signupService;
    }
    */
}
