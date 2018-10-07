package org.silkdog.maven.hikoco.item.controller;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.silkdog.maven.hikoco.mycart.service.MyCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@ComponentScan
@RequestMapping("/shop/addToCart")
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
    public String addToCart(@RequestParam("item_amount") int cartCount,
                            @RequestParam("item_id") int itemId,
                            HttpSession session, HttpServletRequest req){
        try{
            /** 로그인 interceptor 적용해야함 */
            Auth auth = (Auth)session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberById(auth.getId());
            final int memId = currentUser.getId();
            final String cartIp = req.getRemoteAddr();

            /** 중복된 값이 있는지 확인 */
            HashMap<String, Object> map = new HashMap<>();
            map.put("mem_id", memId);
            map.put("item_id", itemId);

            final int count = myCartDAO.checkCartListByUserInfo(map);

            // count(*) 가 0일 경우; 어떠한 회원이 어떠한 아이템을 장바구니에 추가한 이력이 없을 경우.
            if(count == 0){
                // 장바구니에 새로 추가
                myCartService.addToMyCart(memId, itemId, cartCount, cartIp);
            }else{
                // 장바구니 column에서 개수만 변경
                myCartService.updateMyCart(memId, itemId, cartCount, cartIp);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:/shop/mycart";
    }
}
