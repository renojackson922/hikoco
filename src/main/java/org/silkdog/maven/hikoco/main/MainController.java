package org.silkdog.maven.hikoco.main;

import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;
import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.hikoco.item.dto.ItemDTO;
import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.silkdog.maven.hikoco.transaction.dao.TransactionDAO;
import org.silkdog.maven.hikoco.transaction.dto.TransactionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

//@SuppressWarnings("SpringMVCViewInspection")
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

    /* Main Page */
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String main(){
        return "main";
    }

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

    @RequestMapping(value="/login.do", method=RequestMethod.GET)
    public String login(){
        return "login";
    }

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


    @RequestMapping(value="/item.do", method=RequestMethod.GET)
    public String item(Model model, HttpServletRequest req){
        int count = categoryDAO.count(1);
        List<CategoryDTO> clist = categoryDAO.listFirstIndent();
        checkItemList(req);
        req.setAttribute("count", count);
        req.setAttribute("clist", clist);
        model.addAttribute("adminMarket","adminMarket");
        return "item";
    }
//
    @RequestMapping(value="/item_detail.do", method = RequestMethod.GET)
    public String itemDetail(){
        return "item_detail";
    }

    /* 카테고리 테스트 */
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
        List<CategoryDTO> clist = categoryDAO.list();
        req.setAttribute("clist", clist);



//        List<CategoryDTO> clist1 = categoryDAO.listByIndent(1);
//        req.setAttribute("clist1", clist1);
//        List<CategoryDTO> clist2 = categoryDAO.listByIndent(2);
//        req.setAttribute("clist2", clist2);
//        List<CategoryDTO> clist3 = categoryDAO.listByIndent(3);
//        req.setAttribute("clist3.;p-", clist3);

    }
    /* ================ */


    /* 아이템 테스트 */
    @RequestMapping(value = "/item_test.do", method= RequestMethod.GET)
    public String itemTest(HttpServletRequest req){
        checkItemList(req);
        return "itemTest";
    }

    @RequestMapping(value="/item_test.do", method=RequestMethod.POST)
    public String itemTestPro(HttpServletRequest req){
        ItemDTO idto = new ItemDTO();
        idto.setItem_title(req.getParameter("item_title"));
        idto.setItem_price(Integer.parseInt(req.getParameter("item_price")));
        idto.setItem_manu(req.getParameter("item_manu"));
        idto.setItem_vendor(req.getParameter("item_vendor"));
        idto.setItem_summary(req.getParameter("item_summary"));
        idto.setItem_pic(req.getParameter("item_pic"));
        idto.setItem_detail(req.getParameter("item_detail"));
        int result = itemDAO.insert(idto);

        checkItemList(req);
        return "redirect:item_test.do";
    }

    public void checkItemList(HttpServletRequest req){
        List<ItemDTO> ilist = itemDAO.list();
        req.setAttribute("ilist", ilist);
    }
    /* ================ */

    @RequestMapping(value="/mycart.do", method=RequestMethod.GET)
    public String mycart(){

        return "mycart";
    }

    @RequestMapping(value="/hbl.do", method=RequestMethod.GET)
    public String hbl(){
        return "hbl";
    }

    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logout(HttpSession session){
        if(session.getAttribute("userid") != null){
            session.removeAttribute("userid");
            if(session.getAttribute("nickname")!= null) session.removeAttribute("nickname");
        }
        session.invalidate();
        return "redirect:/";
    }
}
