package org.silkdog.maven.hikoco.main;

import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;
import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.hikoco.item.dto.ItemDTO;
import org.silkdog.maven.hikoco.transaction.dao.TransactionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController{
//    @Autowired
//    private MemberDAO memberDAO;
    @Autowired
    private TransactionDAO transactionDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private ItemDAO itemDAO;
    /*  @Repository 일관성 확인할 것 */

    /* ======================================================== */
    /* ======================= 메인 페이지 ======================= */
    /* ======================================================== */

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainRedirect(HttpServletRequest req, Model model){
        specialOffer1(req, model);
        specialOffer2(req, model);
        return "main";
    }

    public void specialOffer1(HttpServletRequest req, Model model){
        List<HashMap> ilistVega = itemDAO.search("vega");
        System.out.println("특별전 프로모션1 테스트: " + ilistVega);
        req.setAttribute("ilistVega", ilistVega);
        model.addAttribute("cntVega", ilistVega);
    }

    public void specialOffer2(HttpServletRequest req, Model model){
        List<HashMap> ilistRyzen = itemDAO.search("라이젠");
        System.out.println("특별전 프로모션1 테스트: " + ilistRyzen);
        req.setAttribute("ilistRyzen", ilistRyzen);
        model.addAttribute("cntRyzen", ilistRyzen);
    }


    /* ======================================================== */
    /* ======================= 관리자 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping("/admin.do")
    public String admin() throws Exception{
        return "admin/admin";
    }

    @RequestMapping("/admin_member.do")
    public String adminMember(Model model, HttpServletRequest req) throws Exception{
//        List<MemberDTO> mlist = memberDAO.select();
//        MemberDTO mdto = memberDAO.selectOne();
//        req.setAttribute("mlist", mlist);
//        req.setAttribute("mdto", mdto);
//        model.addAttribute("adminMember","adminMember");
        return "admin/admin_member";
    }

    @RequestMapping("/admin_tx.do")
    public String adminTx(Model model, HttpServletRequest req) throws Exception{
//        TransactionDTO tdto = transactionDAO.selectOne();
//        req.setAttribute("tdto", tdto);
//        model.addAttribute("adminTx","adminTx");
        return "admin/admin_tx";
    }

    @RequestMapping(value="/admin_market.do", method=RequestMethod.GET)
    public String adminMarket() throws Exception{
//        int count = categoryDAO.count();
//        List<CategoryDTO> clist = categoryDAO.list();
//        req.setAttribute("count", count);
//        req.setAttribute("clist", clist);
        return "admin/admin_market";
    }

    @RequestMapping(value="/admin_market.do", method=RequestMethod.POST)
    public String adminMarketSubmit() throws Exception{
        return "admin/admin_market";
    }
    /* ======================================================== */

    /* ======================================================== */
    /* ======================= 로그인 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/login.do", method=RequestMethod.GET)
    public String login(){
        return "login";
    }

    /* ======================================================== */
    /* ====================== 회원가입 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/signup.do", method=RequestMethod.GET)
    public String signup(){
        return "signup";
    }

/*    @RequestMapping(value="/signup.do", method=RequestMethod.POST)
    public int signupPro(Model model) {
//        int result = memberDAO.insert();
//        if(result == 0){
//            System.out.println("fuck0");
//            return result;
//        }else{
//            System.out.println("hellyeah");
//            return result;
//        }
    }*/

//    @RequestMapping(value="/signup.do", method = RequestMethod.GET)
//    public String signup(){
//        return "signup";
//    }

    @RequestMapping(value="/signup.do", method = RequestMethod.POST)
    public String signup_PRO(HttpServletRequest req){
        req.getParameter("hic_email");
        req.getParameter("hic_pw");

        return "main";
    }

    // 같은 내용을 합칠 수도 있음. p.286 참고

    /* ======================================================== */
    /* ====================== 카테고리 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/category_test.do", method= RequestMethod.GET)
    public String categoryTest(HttpServletRequest req){
        checkCategoryList(req);
        return "categoryTest";
    }

    @RequestMapping(value="/category_test.do", method= RequestMethod.POST)
    public String categoryTestPro(HttpServletRequest req){
        CategoryDTO cdto = new CategoryDTO();
        cdto.setHic_parent(String.valueOf(req.getParameter("cat_exists")));
        cdto.setHic_val(req.getParameter("cat_name"));
        int result = categoryDAO.insert(cdto);

        checkCategoryList(req);
        return "redirect:category_test.do"; /*  Important  */
    }

    public void checkCategoryList(HttpServletRequest req){
        List<HashMap> clist = categoryDAO.list();
        req.setAttribute("clist", clist);
    }
    /* ================ */


    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logout(HttpSession session){
        if(session.getAttribute("userid") != null){
            session.removeAttribute("userid");
            if(session.getAttribute("nickname")!= null) session.removeAttribute("nickname");
        }
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="/item_request_test.do", method=RequestMethod.GET)
    public String itemRequestTest(){
        return "item_request_test";
    }



    /* ======================================================== */
    /* ====================== 장바구니 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/mycart.do", method=RequestMethod.GET)
    public String mycart(){

        return "mycart";
    }

    @RequestMapping(value="/hbltest.do", method = RequestMethod.GET)
    public String hbltest(){
        return "hbltest";
    }
}
