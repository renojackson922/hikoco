package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.service.SBLoginService;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

@Controller
@CrossOrigin("*")
//@SessionAttributes("session")
public class EditController {
    private final static String EDIT_URL = "simpleboard/newEdit";
    private final BoardDAO boardDAO;

    @Autowired
    @Qualifier("SBLoginServiceImpl")
    private SBLoginService sbLoginService;

    @Autowired
    public EditController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @RequestMapping(value = "/board/c{category}/r{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("category") int category,
                       @PathVariable("id") int id,
                       HttpSession httpSession,
                       Model model) throws UnsupportedEncodingException { //, @ModelAttribute("boardVO") BoardVO boardVO

        sbLoginService.checkSession(httpSession, model);

        BoardVO boardVO = boardDAO.detailById(id);
        String str = new String((boardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8);
        String strConverted = conversion(str);

        boardVO.setDetail(strConverted);
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("category", category);
        return EDIT_URL;
    }

    @RequestMapping(value = "/board/c{category}/r{id}/edit", method=RequestMethod.POST)
    public String editPro(@PathVariable("category") int category,
                          @PathVariable("id") int id,
                          HttpServletRequest req,
                          Model model){
//        System.out.println(req.getParameter("username"));
//        System.out.println(req.getParameter("detail"));
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("id", id);
        hashMap.put("username", req.getParameter("username"));
        hashMap.put("password", req.getParameter("password"));
        hashMap.put("category", req.getParameter("category"));
        hashMap.put("title", req.getParameter("title"));
        hashMap.put("detail", req.getParameter("detail"));
        model.addAttribute("category", category);

//        int update = boardDAO.update(boardVO);
        int update = boardDAO.update(hashMap);
        return "redirect:/board/c{category}/r{id}";
    }

    public String conversion(String str){
//        str = str.replaceAll("<","&lt;");
//        str = str.replaceAll(">","&gt;");
//        str = str.replaceAll("\"","&quot;");
        str = str.replaceAll("'","&#39;");
//        str = str.replaceAll("(\r\n|\n)","<br />");
        return str;
    }
}
