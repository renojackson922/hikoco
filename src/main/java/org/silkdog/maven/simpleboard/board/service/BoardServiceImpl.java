package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;

@Service
public class BoardServiceImpl implements BoardService {

    public BoardServiceImpl(HttpServletRequest req, BoardDAO boardDAO) {
        this.req = req;
        this.boardDAO = boardDAO;
    }

    private HttpServletRequest req;

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public void addData(BoardVO boardVO) {
        Date date = new Date();
        boardVO.setWritedate(new Timestamp(date.getTime()));
        boardVO.setWriteip(req.getRemoteAddr());
        boardVO.setLastEditedDate(new Timestamp(date.getTime()));
        boardVO.setLastEditedIp(req.getRemoteAddr());

        int res = boardDAO.insert(boardVO);
    }
}
