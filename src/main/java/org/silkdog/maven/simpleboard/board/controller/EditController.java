package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

@CrossOrigin
@Controller
public class EditController {
    private final BoardDAO boardDAO;

    @Autowired
    public EditController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @RequestMapping(value = "/board/c{category}/r{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("category") int category,
                       @PathVariable("id") int id, Model model) throws UnsupportedEncodingException { //, @ModelAttribute("boardVO") BoardVO boardVO
        BoardVO boardVO = boardDAO.detailById(id);
        boardVO.setDetail(new String((boardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("category", category);
        return "simpleboard/edit";
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
}
