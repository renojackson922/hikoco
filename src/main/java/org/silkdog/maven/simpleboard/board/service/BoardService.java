package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {
    void addData(BoardVO boardVO);
}
