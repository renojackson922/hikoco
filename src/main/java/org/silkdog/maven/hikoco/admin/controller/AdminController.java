package org.silkdog.maven.hikoco.admin.controller;

import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.hikoco.item.vo.ItemVO;
import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * AuthInterceptor 기능 추가하였으니, 필요없는 인증 프로세스는 모두 삭제할 것.
 * */

@Controller
public class AdminController {
    @Autowired
    private MemberDAO memberDAO;

    @Autowired
    private ItemDAO itemDAO;

    @RequestMapping("/admin")
    public String admin(HttpSession session, Model model) throws Exception{
        /**
         *  Clear
         *  */
        try{
            Auth auth = (Auth)session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberByUserid(auth.getUserid());
            model.addAttribute("currentUser", currentUser);
            /** 최근 가입한 회원 module */
            List<MemberVO> recentMemberList = memberDAO.recentMemberList();
            model.addAttribute("recentMemberList", recentMemberList);
            /** 최근 등록된 물품 module */
            List<ItemVO> recentItemList = itemDAO.recentItemList();
            model.addAttribute("recentItemList", recentItemList);
            return "admin/admin";
        }catch(NullPointerException e){
            return "redirect:/";
        }
    }

    @RequestMapping("/admin/admin_member")
    public String adminMember(HttpSession session, Model model, HttpServletRequest req) throws Exception{
        try {
            Auth auth = (Auth) session.getAttribute("auth");
            MemberVO currentUser = memberDAO.getFullMemberByUserid(auth.getUserid());
            List<MemberVO> memberList = memberDAO.memberList();
            model.addAttribute("memberList", memberList);
            model.addAttribute("currentUser", currentUser);
            return "admin/admin_member";
        }catch(Exception e){
            return "redirect:/login";
        }
    }

    // 서비스 흉내, Validator로 바꿔야 함
    public boolean checkSession(HttpSession session){
        try{
            Auth auth = (Auth) session.getAttribute("auth");
            if(auth != null){
                return true;
            }
            return false;
        }catch(Exception e){
            return false;
        }
    }

    @RequestMapping(value="/admin/admin_member/memberedit", method=RequestMethod.GET)
    public String memberEdit(HttpSession session, Model model){

        if(checkSession(session) == true){
            int id = (int)session.getAttribute("id");
            MemberVO memberVO = memberDAO.getFullMemberById(id);
            model.addAttribute("memberInfo", memberVO);
            return "admin/admin_member_edit";
        }else{
            return "redirect:/";
        }
    }

    @RequestMapping(value="/admin/admin_member/memberedit", method=RequestMethod.POST)
    public String memberEditPro(@ModelAttribute("memberInfo") MemberVO memberVO, Model model){
        model.addAttribute("memberInfo");
        return "admin/admin_member_edit";
    }

    @RequestMapping(value="/admin/auth", method=RequestMethod.GET)
    public String adminAuth(){
        return "admin/auth/admin_auth";
    }

    @RequestMapping(value="/admin/auth", method=RequestMethod.POST)
    public String adminAuthPRO(@RequestParam("password") String password,
                               @RequestParam("id") int id,  // 수정하고자 하는 회원의 회원번호
                               HttpSession session,
                               HttpServletRequest req,
                               Model model,
                               RedirectAttributes redirectAttributes) throws NullPointerException{
        // 현재 세션 정보 가져오기
        Auth auth = (Auth)session.getAttribute("auth");
        MemberVO currentUser = memberDAO.getFullMemberByUserid(auth.getUserid());

        // 자격증명
        final String sha1 = org.apache.commons.codec.digest.DigestUtils.sha1Hex(password);

        if(currentUser.getPassword().equals(sha1)){
//            redirectAttributes.addFlashAttribute("id", id); // URL에 파라미터가 남지 않음.
            session.setAttribute("id", id);
//            req.setAttribute("id", id);
            return "redirect:/admin/admin_member/memberedit";
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
