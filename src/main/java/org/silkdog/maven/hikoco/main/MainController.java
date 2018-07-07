package org.silkdog.maven.hikoco.main;

import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@CrossOrigin(origins = "*")
@Controller
public class MainController {
    @Autowired
    private ItemDAO itemDAO;
    /*  @Repository 일관성 확인할 것 */

    /* ======================================================== */
    /* ======================= 메인 페이지 ======================= */
    /* ======================================================== */

    @RequestMapping("/")
    public String main(HttpServletRequest req, Model model) {
        specialOffer1(req, model);
        specialOffer2(req, model);
        return "main";
    }

    public void specialOffer1(HttpServletRequest req, Model model) {
        List<HashMap> ilistVega = itemDAO.search("vega");
        System.out.println("특별전 프로모션1 테스트: " + ilistVega);
        req.setAttribute("ilistVega", ilistVega);
        model.addAttribute("cntVega", ilistVega);
    }

    public void specialOffer2(HttpServletRequest req, Model model) {
        List<HashMap> ilistRyzen = itemDAO.search("라이젠");
        System.out.println("특별전 프로모션1 테스트: " + ilistRyzen);
        req.setAttribute("ilistRyzen", ilistRyzen);
        model.addAttribute("cntRyzen", ilistRyzen);
    }
}
