package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.dao.SBCommentDAO;
import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class SBCommentServiceImpl implements SBCommentService {
    @Autowired
    @Qualifier("SBCommentServiceImpl")
    private SBCommentService sbCommentService;

    @Autowired
    private SBBoardDAO sbBoardDAO;

    @Autowired
    private SBCommentDAO sbCommentDAO;

    /** ????? */
    public void CommentServiceImpl(SBBoardDAO sbBoardDAO, SBCommentDAO sbCommentDAO, SBCommentService sbCommentService){
        this.sbBoardDAO = sbBoardDAO;
        this.sbCommentDAO = sbCommentDAO;
        this.sbCommentService = sbCommentService;
    }

    @Override
    public void putInfoBeforeInsert(SBCommentVO sbCommentVO) {
        /** /r/n 을 <br/> 로 치환*/
        String str = sbCommentVO.getDetail();
        str = str.replaceAll("(\r\n|\n)", "<br />");
        sbCommentVO.setDetail(str);

        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        sbCommentVO.setWritedate(sqlDate);
        sbCommentVO.setLastEditedDate(sqlDate);
        /** TEMPORARILY CODED */
        sbCommentVO.setWriteip("127.0.0.1");
        sbCommentVO.setLastEditedIp("127.0.0.1");

        sbCommentDAO.insert(sbCommentVO);
        addCommentCntToBoard(sbCommentVO.getBoardId());
    }

    @Override
    public void addCommentCntToBoard(int boardId){
        sbBoardDAO.addCommentCntToBoard(boardId);
    }

    @Override
    public void subtractCommentCntToBoard(int boardId) {
        sbBoardDAO.subtractCommentCntToBoard(boardId);
    }
}
