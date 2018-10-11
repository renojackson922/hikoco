package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.stereotype.Service;

@Service
public interface CommentService {
    void putInfoBeforeInsert(CommentVO commentVO);
    void addCommentCntToBoard(int boardId);
    void subtractCommentCntToBoard(int boardId);
}
