package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.service.SBBoardService;
import org.silkdog.maven.simpleboard.board.validator.SBAuthValidator;
import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@CrossOrigin
@Controller
@RequestMapping("/c{category}/write")
public class SBWriteController {
    private final static String WRITE_URL = "simpleboard/newWrite";
    private final SBBoardDAO SBBoardDAO;
    private SBBoardService SBBoardService;

    @Autowired
    public SBWriteController(SBBoardDAO SBBoardDAO, SBBoardService SBBoardService) {
        this.SBBoardDAO = SBBoardDAO;
        this.SBBoardService = SBBoardService;
    }

    @GetMapping
    public String write(@PathVariable("category") int category,
                        @ModelAttribute("boardVO") SBBoardVO SBBoardVO,
                        Model model){
        System.out.println("카테고리 번호: " + category);
        model.addAttribute("category", category);
        return WRITE_URL;
    }

    @PostMapping
    public String writePro(@PathVariable("category") int category,
                           @ModelAttribute("boardVO") SBBoardVO SBBoardVO,
                           final BindingResult bindingResult,
                           HttpServletRequest req){

        new SBAuthValidator(SBBoardDAO).validate(SBBoardVO, bindingResult);
        if(bindingResult.hasErrors()){
            return WRITE_URL;
        }

        /** Validator 서비스를 통해 오류 검출 */

        SBBoardService.addData(SBBoardVO, req);

        return "redirect:/board/c" + category;
    }
}
