package org.silkdog.maven.hikoco.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    /* ======================================================== */
    /* ======================= 관리자 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping("/admin.do")
    public String admin() throws Exception {
        return "admin/admin";
    }

    @RequestMapping("/admin_member.do")
    public String adminMember(Model model, HttpServletRequest req) throws Exception {
//        List<MemberDTO> mlist = memberDAO.select();
//        MemberDTO mdto = memberDAO.selectOne();
//        req.setAttribute("mlist", mlist);
//        req.setAttribute("mdto", mdto);
//        model.addAttribute("adminMember","adminMember");
        return "admin/admin_member";
    }

    @RequestMapping("/admin_tx.do")
    public String adminTx(Model model, HttpServletRequest req) throws Exception {
//        TransactionDTO tdto = transactionDAO.selectOne();
//        req.setAttribute("tdto", tdto);
//        model.addAttribute("adminTx","adminTx");
        return "admin/admin_tx";
    }

    @RequestMapping(value = "/admin_market.do", method = RequestMethod.GET)
    public String adminMarket() throws Exception {
//        int count = categoryDAO.count();
//        List<CategoryDTO> clist = categoryDAO.list();
//        req.setAttribute("count", count);
//        req.setAttribute("clist", clist);
        return "admin/admin_market";
    }

    @RequestMapping(value = "/admin_market.do", method = RequestMethod.POST)
    public String adminMarketSubmit() throws Exception {
        return "admin/admin_market";
    }

}
