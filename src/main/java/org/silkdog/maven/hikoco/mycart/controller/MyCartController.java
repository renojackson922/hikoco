package org.silkdog.maven.hikoco.mycart.controller;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyCartController {
    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private MyCartDAO myCartDAO;

    @RequestMapping(value = "/shop/mycart", method = RequestMethod.GET)
    public String mycart(Model model, HttpSession session, HttpServletRequest req) {
        try{
            Auth auth = (Auth)session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberById(auth.getId());
            final int memId = currentUser.getId();
            /**
             * memId 로 등록되어 있는 모든 장바구니 리스트 필터하여 가져오기.
             * */
            List<MyCartVO> myCartList = myCartDAO.myCartList(memId);
            System.out.println("야옹이: " + myCartList);
            model.addAttribute("myCartList", myCartList);

        }catch(Exception e){
            e.printStackTrace();
        }

        return "hikoco/mycart";
    }
}
