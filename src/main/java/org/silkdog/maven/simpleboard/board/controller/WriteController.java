package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.service.BoardService;
import org.silkdog.maven.simpleboard.board.validator.AuthValidator;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@CrossOrigin
@Controller
@RequestMapping("/c{category}/write")
public class WriteController {
    private final BoardDAO boardDAO;
    private BoardService boardService;

    @Autowired
    public WriteController(BoardDAO boardDAO, BoardService boardService) {
        this.boardDAO = boardDAO;
        this.boardService = boardService;
    }

    @GetMapping
    public String write(@PathVariable("category") int category,
                        @ModelAttribute("boardVO") BoardVO boardVO,
                        Model model){
        System.out.println("카테고리 번호: " + category);
        model.addAttribute("category", category);
        return "simpleboard/write";
    }

    @PostMapping
    public String writePro(@PathVariable("category") int category,
                           @ModelAttribute("boardVO") BoardVO boardVO,
                           final BindingResult bindingResult,
                           HttpServletRequest req){

        new AuthValidator(boardDAO).validate(boardVO, bindingResult);
        if(bindingResult.hasErrors()){
            return "simpleboard/write";
        }

        /** Validator 서비스를 통해 오류 검출 */

        boardService.addData(boardVO, req);

        return "redirect:/board/c" + category;
    }
}
