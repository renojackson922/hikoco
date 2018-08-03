package org.silkdog.maven.hikoco.item.controller;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.silkdog.maven.hikoco.mycart.service.MyCartService;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@ComponentScan
@RequestMapping("/addToCart")
public class AddToCartController {
    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private MyCartDAO myCartDAO;
    @Autowired
    private MyCartService myCartService;

    public void setMyCartService(MyCartService myCartService) {
        this.myCartService = myCartService;
    }

    @PostMapping
    public String addToCart(@RequestParam("item_amount") int itemAmount,
                            @RequestParam("item_id") int itemId,
                            HttpSession session, HttpServletRequest req){
        try{
            Auth auth = (Auth)session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberById(auth.getId());
            final int memId = currentUser.getId();
            final String currentIp = req.getRemoteAddr();

            /** 중복된 값이 있는지 확인 */
            MyCartVO myCartVO = myCartDAO.checkCartListByUserInfo(itemId, itemAmount);
            if(myCartVO == null){
                myCartService.addToMyCart(memId, itemId, itemAmount, currentIp);
            }else{
                myCartService.addToMyCartAlterAmount(memId, itemId, itemAmount, currentIp);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:mycart";
    }
}
