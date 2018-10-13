package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Repository
public class SBBoardServiceImpl implements SBBoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public void addData(BoardVO boardVO, HttpServletRequest req) {
//        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        boardVO.setWritedate(sqlDate);
        boardVO.setWriteip(req.getRemoteAddr());
        boardVO.setLastEditedDate(sqlDate);
        boardVO.setLastEditedIp(req.getRemoteAddr());

        int res = boardDAO.insert(boardVO);
    }

    @Override
    public void addHit(int boardId) {
        boardDAO.addHit(boardId);
    }
}
