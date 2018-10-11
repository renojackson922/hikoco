package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.dao.CommentDAO;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentService commentService;

    @Autowired
    private BoardDAO boardDAO;

    @Autowired
    private CommentDAO commentDAO;

    /** ????? */
    public void CommentServiceImpl(BoardDAO boardDAO, CommentDAO commentDAO, CommentService commentService){
        this.boardDAO = boardDAO;
        this.commentDAO = commentDAO;
        this.commentService = commentService;
    }


    @Override
    public void putInfoBeforeInsert(CommentVO commentVO) {
        /** /r/n 을 <br/> 로 치환*/
        String str = commentVO.getDetail();
        str = str.replaceAll("(\r\n|\n)", "<br />");
        commentVO.setDetail(str);

        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        commentVO.setWritedate(sqlDate);
        commentVO.setLastEditedDate(sqlDate);
        /** TEMPORARILY CODED */
        commentVO.setWriteip("127.0.0.1");
        commentVO.setLastEditedIp("127.0.0.1");

        commentDAO.insert(commentVO);
        addCommentCntToBoard(commentVO.getBoardId());
    }

    @Override
    public void addCommentCntToBoard(int boardId){
        boardDAO.addCommentCntToBoard(boardId);
    }

    @Override
    public void subtractCommentCntToBoard(int boardId) {
        boardDAO.subtractCommentCntToBoard(boardId);
    }
}
