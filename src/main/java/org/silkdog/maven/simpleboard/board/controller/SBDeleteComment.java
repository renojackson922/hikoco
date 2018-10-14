package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.dao.SBCommentDAO;
import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("/board/deleteComment")
public class SBDeleteComment {

    @Autowired
    private SBBoardDAO SBBoardDAO;

    @Autowired
    private SBCommentDAO SBCommentDAO;

    @PostMapping
    public String deleteCommentPOST(@RequestParam("pw") String pw,
                                    @RequestParam("category") int category,
                                    @RequestParam("boardId") int boardId,
                                    @RequestParam("dataId") int dataId){

        System.out.println("누가 나를 불렀소?");
        SBCommentVO SBCommentVO = SBCommentDAO.getOneCommentById(dataId);
        if(SBCommentVO.getPw().equals(pw) && pw.equals(SBCommentVO.getPw())){
            System.out.println("비번 맞음!");
            Date date = new Date();
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            SBBoardDAO.subtractCommentCntToBoard(boardId);
            SBCommentDAO.deleteComment(dataId);

        }

        return "redirect:/board/c" + category + "/r" + boardId;
    }
}
