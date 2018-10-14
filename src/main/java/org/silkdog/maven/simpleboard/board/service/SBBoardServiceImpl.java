package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Repository
public class SBBoardServiceImpl implements SBBoardService {

    @Autowired
    private SBBoardDAO sbBoardDAO;

    @Override
    public void addData(SBBoardVO SBBoardVO, HttpServletRequest req) {
//        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        SBBoardVO.setWritedate(sqlDate);
        SBBoardVO.setWriteip(req.getRemoteAddr());
        SBBoardVO.setLastEditedDate(sqlDate);
        SBBoardVO.setLastEditedIp(req.getRemoteAddr());

        int res = sbBoardDAO.insert(SBBoardVO);
    }

    @Override
    public void addHit(int boardId) {
        sbBoardDAO.addHit(boardId);
    }
}
