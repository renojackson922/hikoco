package org.silkdog.maven.hikoco.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyCartController {
    /* ======================================================== */
    /* ====================== 장바구니 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value = "/mycart", method = RequestMethod.GET)
    public String mycart() {

        return "mycart";
    }
}
