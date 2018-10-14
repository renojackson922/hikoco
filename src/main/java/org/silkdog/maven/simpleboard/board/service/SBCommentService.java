package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;
import org.springframework.stereotype.Service;

@Service
public interface SBCommentService {
    void putInfoBeforeInsert(SBCommentVO sbCommentVO);
    void addCommentCntToBoard(int boardId);
    void subtractCommentCntToBoard(int boardId);
}
