package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface SBBoardService {
    void addData(SBBoardVO sbBBoardVO, HttpServletRequest req);
    void addHit(int id);
}
