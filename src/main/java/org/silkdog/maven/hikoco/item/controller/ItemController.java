package org.silkdog.maven.hikoco.item.controller;

import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.hikoco.item.dao.ItemOnelineDAO;
import org.silkdog.maven.hikoco.item.vo.ItemOnelineVO;
import org.silkdog.maven.hikoco.item.vo.ItemVO;
import org.silkdog.maven.hikoco.member.authenticator.Auth;
import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ItemController {
    @Autowired
    private ItemDAO itemDAO;
    @Autowired
    private MyCartDAO myCartDAO;
    @Autowired
    private ItemOnelineDAO itemOnelineDAO;

    /* ======================================================== */
    /* ======================= 아이템 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/shop/item", method=RequestMethod.GET)
    public String item(HttpServletRequest req, Model model, @RequestParam("mode") String mode){
        String searchString = req.getParameter("search_string");
        checkItemList(req, model, mode, searchString);
        /* 시그니쳐 아이템 */
//        List<HashMap> ilistSign = itemDAO.getSignatureItems();
//        req.setAttribute("ilistSign", ilistSign);
//        model.addAttribute("signCnt", ilistSign);
        return "hikoco/item";
    }

    @RequestMapping(value = "/shop/item_test", method= RequestMethod.GET)
    public String itemTest(HttpServletRequest req, Model model){
        checkItemList(req, model);
        return "test/item_test";
    }

    @RequestMapping(value="/shop/item_test", method=RequestMethod.POST)
    public String itemTestPro(HttpServletRequest req, Model model){
        ItemVO idto = new ItemVO();

        java.util.Date date = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        idto.setItem_title(req.getParameter("item_title"));
        idto.setItem_price(Integer.parseInt(req.getParameter("item_price")));
        idto.setItem_manu(req.getParameter("item_manu"));
        idto.setItem_vendor(req.getParameter("item_vendor"));
        idto.setItem_summary(req.getParameter("item_summary"));
        idto.setItem_pic(req.getParameter("item_pic"));
        idto.setItem_detail(req.getParameter("item_detail"));
        idto.setItem_detail2(req.getParameter("item_detail2"));
        idto.setItem_detail3(req.getParameter("item_detail3"));
        idto.setItem_upload_date(timestamp);
        idto.setItem_last_edited_date(timestamp);
        int result = itemDAO.insert(idto);

        checkItemList(req, model);
        return "redirect:/shop/item_test";
    }

//    @RequestMapping(value="/item_test.do", method=RequestMethod.POST, params="action=remove")
//    public String itemTestDelete(HttpServletRequest req){
//        int itemId = Integer.parseInt(req.getParameter("item_id"));
//        itemDAO.delete(itemId);
//        return "redirect:item_test.do";
//    }


    public void checkItemList(HttpServletRequest req, Model model){
        List<HashMap> ilist = itemDAO.list();
        req.setAttribute("ilist", ilist);
        model.addAttribute("cnt", ilist);
    }

    public void checkItemList(HttpServletRequest req, Model model, String mode, String searchString){
        // mode의 값이 list일 경우 모든 list 저장
        if(mode.equals("list") && searchString == null){
            List<HashMap> ilist = itemDAO.list();
//            System.out.println("List 테스트: " + ilist.get(0).get("item_title"));
            int listcount = itemDAO.countFromList();
//            System.out.println(listcount);

            req.setAttribute("ilist", ilist);
            req.setAttribute("mode", mode);
            model.addAttribute("cnt", ilist);
            model.addAttribute("listcount", listcount);
            req.setAttribute("listcount2", listcount);

            getPagination(listcount);

            // mode의 값이 search일 경우 search(searchString)을 조회후 list로 저장
        }else if(mode.equals("search") && searchString != null){
            List<HashMap> ilist = itemDAO.search(searchString);
//            System.out.println("Search 테스트: " + ilist.get(0).get("item_title"));
            int listcount = itemDAO.countFromList();
//            System.out.println(listcount);

            req.setAttribute("ilist", ilist);
            req.setAttribute("mode", mode);
            model.addAttribute("cnt", ilist);
            model.addAttribute("searchString", searchString);
            model.addAttribute("listcount", listcount);
            req.setAttribute("listcount2", listcount);

            getPagination(listcount);

        }else{
            System.out.println("Unexpected access detected!");
        }
    }

    /* 인덱스 갯수 계산하기 */
    public void getPagination(int listcount){
        //    if(countDIV > (int)Math.ceil(count / 6)){
//        cat_height = (int)Math.ceil(count/6) + 1;
//    }else{
//        cat_height = (int)Math.ceil(count/6);
//    }
        int index;

        if((listcount % 10) == 0 || listcount < 10){
            index = (int)Math.ceil(listcount / 10);
        }else{
            index = (int)Math.ceil(listcount / 10)+1;
        }

        System.out.println(index);
    }

    // Mimicking REST
    /** item_detail.jsp  */
    @RequestMapping("/shop/item/{itemId}")
    public String itemDetail(@PathVariable String itemId,
                             HttpServletRequest req,
                             HttpSession session,
                             Model model) {
        try{
            int item = Integer.parseInt(itemId);
            ItemVO itemVO = itemDAO.select(item);
            if(itemVO == null){
                System.out.println("[Error] Unknown itemId. Forward to Mainpage.");
                return "redirect:/shop";
            }

            /** Auth 권한 철저히 검증할 것. */
            // 아이템이 장바구니에 있는지 확인
            int isItemExists = checkAuth(item, session);
            System.out.println(isItemExists);
            model.addAttribute("isItemExists", isItemExists);

            // 작성된 한줄평이 있는지 확인
            List<ItemOnelineVO> reviewListByItemId = checkOnelineReview(item);
            model.addAttribute("reviewListByItemId", reviewListByItemId);

            // 회원이 한줄평을 작성했는지 확인
            /** 권한, 세션 확인 중요! */
            if(session == null || session.getAttribute("auth") == null){
                int isReviewExists = 0;
                model.addAttribute("isReviewExists", isReviewExists);
            }else{
                Auth auth = (Auth)session.getAttribute("auth");
                HashMap<String, Object> map = new HashMap<>();
                map.put("memId", auth.getId());
                map.put("itemId", item);
                int isReviewExists = itemOnelineDAO.isReviewExists(map);
                model.addAttribute("currentUser", auth);
                model.addAttribute("isReviewExists", isReviewExists);
            }

            // 팝업창인지 확인
            String check = req.getParameter("check");
            model.addAttribute("check", check);

            // 아이템 정보 모델의 애트리뷰트로 저장.
            model.addAttribute("itemVO", itemVO);

            return "hikoco/item_detail";
        }catch(Exception e){
            e.printStackTrace();
            return "redirect:/shop";
        }
    }

    /** 서비스로 보내버리기 */
    public int checkAuth(int item, HttpSession session){
        try{
            Auth auth = (Auth)session.getAttribute("auth");
            HashMap<String, Object> map = new HashMap<>();
            map.put("mem_id", auth.getId());
            map.put("item_id", item);
            final int foo = myCartDAO.checkCartListByUserInfo(map);
            return foo;
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /** 서비스로 보내버리기 */
    public List<ItemOnelineVO> checkOnelineReview(int itemId){
        try{
            List<ItemOnelineVO> list = itemOnelineDAO.listByItemId(itemId);
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/shop/item/itemOneline", method = RequestMethod.GET)
    public String itemOneline(HttpSession session, Model model,
                              @RequestParam("itemId") int itemId) {
        if(session.getAttribute("auth") == null){
            // 원래는 창 종료하기
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return "redirect:/shop";
        }else{
            Auth auth = (Auth)session.getAttribute("auth");
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("memId", auth.getId());
            hashMap.put("itemId", itemId);
            model.addAttribute("hashMap", hashMap);
            return "hikoco/item_oneline";
        }
    }

    @RequestMapping(value="/shop/item/itemOneline", method = RequestMethod.POST)
    public void itemOnelinePro(HttpServletRequest req,
                               @RequestParam("memId") int memId,
                               @RequestParam("itemId") int itemId,
                               @RequestParam("title") String title,
                               @RequestParam("star") int star,
                               @RequestParam("detail") String detail){

        java.util.Date date = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        ItemOnelineVO itemOnelineVO = new ItemOnelineVO(memId, itemId, star, title, detail);
        itemOnelineVO.setWritedate(timestamp);
        itemOnelineVO.setLastEditedDate(timestamp);
        itemOnelineVO.setWriteIp(req.getRemoteAddr());

        int res = itemOnelineDAO.insert(itemOnelineVO);
    }

}
