package org.silkdog.maven.hikoco.main;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.silkdog.maven.hikoco.transaction.dao.TransactionDAO;
import org.silkdog.maven.hikoco.transaction.dto.TransactionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController{
    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private TransactionDAO transactionDAO;

    @RequestMapping("/hello.do")
    public String main(Model model){
        model.addAttribute("greeting","안녕하세요?");
        return "hello";
    }

    @RequestMapping("/admin.do")
    public String admin(Model model) throws Exception{

        model.addAttribute("admin1","어드민1");

        return "admin";
    }

    @RequestMapping("/admin_member.do")
    public String adminMember(Model model, HttpServletRequest req) throws Exception{
        List<MemberDTO> mlist = memberDAO.select();
        MemberDTO mdto = memberDAO.selectOne();
        req.setAttribute("mlist", mlist);
        req.setAttribute("mdto", mdto);
        model.addAttribute("adminMember","adminMember");
        return "admin_member";
    }

    @RequestMapping("/admin_tx.do")
    public String adminTx(Model model, HttpServletRequest req) throws Exception{
        TransactionDTO tdto = transactionDAO.selectOne();
        req.setAttribute("tdto", tdto);
        model.addAttribute("adminTx","adminTx");
        return "admin_tx";
    }

    @RequestMapping(value="/admin_market.do", method=RequestMethod.GET)
    public String adminMarket(Model model) throws Exception{
        model.addAttribute("adminMarket","adminMarket");
        return "admin_market";
    }

    @RequestMapping(value="/admin_market.do", method=RequestMethod.POST)
    public String adminMarketSubmit(Model model) throws Exception{
        return "admin_market";
    }
    // 같은 내용을 합칠 수도 있음. p.286 참고
}
