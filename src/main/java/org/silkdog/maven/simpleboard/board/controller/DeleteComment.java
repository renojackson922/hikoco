package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.dao.CommentDAO;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/board/deleteComment")
public class DeleteComment {

    @Autowired
    private BoardDAO boardDAO;

    @Autowired
    private CommentDAO commentDAO;

    @PostMapping
    public String deleteCommentPOST(@RequestParam("pw") String pw,
                                    @RequestParam("category") int category,
                                    @RequestParam("boardId") int boardId,
                                    @RequestParam("dataId") int dataId){

        System.out.println("누가 나를 불렀소?");
        CommentVO commentVO = commentDAO.getOneCommentById(dataId);
        if(commentVO.getPw().equals(pw) && pw.equals(commentVO.getPw())){
            System.out.println("비번 맞음!");
            Date date = new Date();
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            boardDAO.subtractCommentCntToBoard(boardId);
            commentDAO.deleteComment(dataId);

        }

        return "redirect:/board/c" + category + "/r" + boardId;
    }
}
