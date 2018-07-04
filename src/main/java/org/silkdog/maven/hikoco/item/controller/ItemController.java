package org.silkdog.maven.hikoco.item.controller;

import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.hikoco.item.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ItemController {
    @Autowired
    private ItemDAO itemDAO;

    /* ======================================================== */
    /* ======================= 아이템 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value="/item.do", method=RequestMethod.GET)
    public String item(HttpServletRequest req, Model model, @RequestParam("mode") String mode){
        String searchString = req.getParameter("search_string");
        checkItemList(req, model, mode, searchString);
        /* 시그니쳐 아이템 */
//        List<HashMap> ilistSign = itemDAO.getSignatureItems();
//        req.setAttribute("ilistSign", ilistSign);
//        model.addAttribute("signCnt", ilistSign);
        return "item";
    }

    @RequestMapping(value = "/item_test.do", method= RequestMethod.GET)
    public String itemTest(HttpServletRequest req, Model model){
        checkItemList(req, model);
        return "item_test";
    }

    @RequestMapping(value="/item_test.do", method=RequestMethod.POST)
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
        return "redirect:item_test.do";
    }

    @RequestMapping(value="/item_test.do", method=RequestMethod.POST, params="action=remove")
    public String itemTestDelete(HttpServletRequest req){
        int itemId = Integer.parseInt(req.getParameter("item_id"));
        itemDAO.delete(itemId);
        return "redirect:item_test.do";
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

    @RequestMapping(value="/item_detail.do", method = RequestMethod.GET)
    public String itemDetail(@RequestParam("item_id") int itemId, HttpServletRequest req){
        System.out.println("itemID의 값: " + itemId);
        ItemVO idto = itemDAO.select(itemId);
        req.setAttribute("idto", idto);
        return "item_detail";
    }

}
