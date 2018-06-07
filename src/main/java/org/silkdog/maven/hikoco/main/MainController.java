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
import java.io.IOError;
import java.io.IOException;
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
    /*  @Repository 일관성 확인할 것 */
    @Autowired
    private ItemDAO itemDAO;

    /* ======================================================== */
    /* ======================= 메인 페이지 ======================= */
    /* ======================================================== */
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String main(){
        return "main";
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


    /* 아이템 */

//    @RequestMapping(value="/item.do", method=RequestMethod.GET)
//    public String item(Model model, HttpServletRequest req){
//        int count = categoryDAO.count(1);
//        List<CategoryDTO> clist = categoryDAO.listFirstIndent();
//        checkItemList(req);
//        req.setAttribute("count", count);
//        req.setAttribute("clist", clist);
//        model.addAttribute("adminMarket","adminMarket");
//        return "item";
//    }

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

    /* ======================================================== */
    /* ======================= 아이템 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/item.do", method=RequestMethod.GET)
    public String item(HttpServletRequest req,  Model model, @RequestParam("mode") String mode){
        String searchString = req.getParameter("search_string");
        checkItemList(req, model, mode, searchString);
        return "item";
    }

    @RequestMapping(value = "/item_test.do", method= RequestMethod.GET)
    public String itemTest(HttpServletRequest req, Model model){
        checkItemList(req, model);
        return "item_test";
    }

    public void checkItemList(HttpServletRequest req, Model model){
        List<HashMap> ilist = itemDAO.list();
        req.setAttribute("ilist", ilist);
        model.addAttribute("cnt", ilist);
    }

    public void checkItemList(HttpServletRequest req, Model model, String mode, String searchString){
            // mode의 값이 list일 경우 모든 list 저장
        if(mode.equals("list") && searchString == null){
            List<HashMap> ilist = itemDAO.list();
            System.out.println("List 테스트: " + ilist.get(0).get("item_title"));
            req.setAttribute("ilist", ilist);
            req.setAttribute("mode", mode);
            model.addAttribute("cnt", ilist);
            // mode의 값이 search일 경우 search(searchString)을 조회후 list로 저장
        }else if(mode.equals("search") && searchString != null){
            List<HashMap> ilist = itemDAO.search(searchString);
            System.out.println("Search 테스트: " + ilist.get(0).get("item_title"));
            req.setAttribute("ilist", ilist);
            req.setAttribute("mode", mode);
            model.addAttribute("cnt", ilist);
        }else{
            System.out.println("Unexpected access detected!");
        }
    }

    @RequestMapping(value="/item_detail.do", method = RequestMethod.GET)
    public String itemDetail(@RequestParam("item_id") int itemId, HttpServletRequest req){
        System.out.println("itemID의 값: " + itemId);
        ItemDTO idto = itemDAO.select(itemId);
        req.setAttribute("idto", idto);
        return "item_detail";
    }


//    @RequestMapping(value="/item_test.do", method=RequestMethod.POST)
//    public String itemTestPro(HttpServletRequest req, Model model){
//        ItemDTO idto = new ItemDTO();
//
//        java.util.Date date = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
//
//        idto.setItem_title(req.getParameter("item_title"));
//        idto.setItem_price(Integer.parseInt(req.getParameter("item_price")));
//        idto.setItem_manu(req.getParameter("item_manu"));
//        idto.setItem_vendor(req.getParameter("item_vendor"));
//        idto.setItem_summary(req.getParameter("item_summary"));
//        idto.setItem_pic(req.getParameter("item_pic"));
//        idto.setItem_detail(req.getParameter("item_detail"));
//        idto.setItem_upload_date(timestamp);
//        idto.setItem_last_edited_date(timestamp);
//        int result = itemDAO.insert(idto);
//
//        checkItemList(req, model);
//        return "redirect:item_test.do";
//    }




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
}
