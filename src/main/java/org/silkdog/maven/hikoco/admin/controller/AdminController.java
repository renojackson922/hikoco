package org.silkdog.maven.hikoco.admin.controller;

import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberMinifiedVO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private MemberDAO memberDAO;

    @RequestMapping("/admin")
    public String admin(HttpSession session, Model model) {
        Auth auth = (Auth)session.getAttribute("auth");
        MemberVO memberVO = memberDAO.getFullMemberByUserid(auth.getUserid());
        model.addAttribute("member", memberVO);
        return "admin/admin";
    }

    @RequestMapping("/admin_member")
    public String adminMember(HttpSession session, Model model, HttpServletRequest req) throws NullPointerException{
        try {
            Auth auth = (Auth) session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberByUserid(auth.getUserid());
            List<MemberVO> memberList = memberDAO.memberList();
            model.addAttribute("memberList", memberList);
            model.addAttribute("currentUser", currentUser);
            return "admin/admin_member";
        }catch(NullPointerException e){
            /**
             *   LoginInterceptor 일괄 적용하기
             * */
            /*
            String msg = "자격증명 실패! 세션이 없습니다.";
            System.out.println(msg);
            model.addAttribute("msg", msg);
            */
            return "redirect:/login";
        }
        /*
        List<MemberVO> mlist = memberDAO.select();
        MemberVO mdto = memberDAO.selectOne();
        req.setAttribute("mlist", mlist);
        req.setAttribute("mdto", mdto);
        model.addAttribute("adminMember","adminMember");
        */
    }

    @RequestMapping("/memberedit")
    public String memberEdit(@ModelAttribute("memberInfo2") MemberVO memberVO){
        return "admin/admin_member_edit";
    }

    @RequestMapping(value="/admin/auth", method=RequestMethod.GET)
    public String adminAuth(){
        return "admin/auth/admin_auth";
    }

    @RequestMapping(value="/admin/auth", method=RequestMethod.POST)
    public String adminAuthPRO(@RequestParam("password") String password,
                               @RequestParam("id") int id,
                               HttpSession session, HttpServletRequest req, Model model) throws NullPointerException{
        // 현재 세션 정보 가져오기
        Auth auth = (Auth)session.getAttribute("auth");
        MemberVO currentUser = memberDAO.getFullMemberByUserid(auth.getUserid());

        // 자격증명
        final String sha1 = org.apache.commons.codec.digest.DigestUtils.sha1Hex(password);

        if(currentUser.getPassword().equals(sha1)){
            // 수정할 대상 정보 가져오기
            MemberVO memberInfo = memberDAO.getFullMemberById(id);

            model.addAttribute("memberInfo", memberInfo);
            return "forward:/memberedit";
        }else {
            return "redirect:/admin/auth";
        }
    }

    @RequestMapping("/admin_tx")
    public String adminTx(Model model, HttpServletRequest req) {
//        TransactionDTO tdto = transactionDAO.selectOne();
//        req.setAttribute("tdto", tdto);
//        model.addAttribute("adminTx","adminTx");
        return "admin/admin_tx";
    }

    @RequestMapping(value = "/admin_market", method = RequestMethod.GET)
    public String adminMarket() {
//        int count = categoryDAO.count();
//        List<CategoryDTO> clist = categoryDAO.list();
//        req.setAttribute("count", count);
//        req.setAttribute("clist", clist);
        return "admin/admin_market";
    }

    @RequestMapping(value = "/admin_market", method = RequestMethod.POST)
    public String adminMarketSubmit() {
        return "admin/admin_market";
    }

}
