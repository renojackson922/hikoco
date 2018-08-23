package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Service
public class BoardServiceImpl implements BoardService {

    public BoardServiceImpl(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public void addData(BoardVO boardVO, HttpServletRequest req) {
        Date in = new Date();
        LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
        Date today = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());

        boardVO.setWritedate(today);
        boardVO.setWriteip(req.getRemoteAddr());
        boardVO.setLastEditedDate(today);
        boardVO.setLastEditedIp(req.getRemoteAddr());

        int res = boardDAO.insert(boardVO);
    }
}
