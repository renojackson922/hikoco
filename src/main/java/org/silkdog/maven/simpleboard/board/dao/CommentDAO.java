package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.CommentVO;

import java.util.List;

public interface CommentDAO {
    int insert(CommentVO commentVO);
    List<CommentVO> getCommentListByBoardId(int boardId);
}
