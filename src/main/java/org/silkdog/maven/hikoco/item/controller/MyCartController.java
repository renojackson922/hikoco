package org.silkdog.maven.hikoco.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class MyCartController {
    /* ======================================================== */
    /* ====================== 장바구니 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value = "/mycart", method = RequestMethod.GET)
    public String mycart(Model model, HttpServletRequest req) {
//        Map<String, Integer> itemMap = (Map<String, Integer>)req.getAttribute("itemMap");
//        System.out.println("아이템 맵: " + itemMap);
//        System.out.println(itemMap.get("itemAmount"));
        return "mycart";
    }
}
