package org.silkdog.maven.hikoco.category.controller;

import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.vo.CategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryDAO categoryDAO;
    /* ======================================================== */
    /* ====================== 카테고리 페이지 ===================== */
    /* ======================================================== */
    @RequestMapping(value = "/category_test", method = RequestMethod.GET)
    public String categoryTest(HttpServletRequest req) {
        checkCategoryList(req);
        return "categoryTest";
    }

    @RequestMapping(value = "/category_test", method = RequestMethod.POST)
    public String categoryTestPro(HttpServletRequest req) {
        CategoryVO cdto = new CategoryVO();
        cdto.setHic_parent(String.valueOf(req.getParameter("cat_exists")));
        cdto.setHic_val(req.getParameter("cat_name"));
        int result = categoryDAO.insert(cdto);

        checkCategoryList(req);
        return "redirect:category_test"; /*  Important  */
    }

    public void checkCategoryList(HttpServletRequest req) {
        List<HashMap> clist = categoryDAO.list();
        req.setAttribute("clist", clist);
    }
}
