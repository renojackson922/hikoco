package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.CommentDAO;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class CommnetServiceImpl implements CommentService{
    @Autowired
    private CommentDAO commentDAO;

    @Override
    public void putInfoBeforeInsert(CommentVO commentVO) {
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        commentVO.setWritedate(sqlDate);
        commentVO.setLastEditedDate(sqlDate);
        /** TEMPORARILY CODED */
        commentVO.setWriteip("127.0.0.1");
        commentVO.setLastEditedIp("127.0.0.1");

        commentDAO.insert(commentVO);
    }
}
