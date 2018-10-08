package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

@CrossOrigin
@Controller
//@RequestMapping("/board")
@RequestMapping("/board/c{category}/r{id}")
public class ReadController {
    private final BoardDAO boardDAO;

    private static String READ_ARTICLE = "/simpleboard/newReadArticle";

    @Autowired
    public ReadController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @GetMapping
    public String detail(@PathVariable("category") int category,
                         @PathVariable("id") int id,
                         Model model) throws UnsupportedEncodingException {
        BoardVO boardVO = boardDAO.detailById(id);
        /** DB가 EUC-KR 이라서, UTF-8로 변환하는 작업 필요. (예. 일본어 표시) */
        boardVO.setDetail(new String((boardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("category", category);
        return READ_ARTICLE;
    }

//    public String test(){
//        return READ_ARTICLE;
//    }

    /*
    @PostMapping
    public String detailPro(){
        return "";
    }
    */
}
