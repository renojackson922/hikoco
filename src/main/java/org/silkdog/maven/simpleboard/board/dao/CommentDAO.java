package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.CommentVO;

import java.util.HashMap;
import java.util.List;

public interface CommentDAO {
    int insert(CommentVO commentVO);
    List<CommentVO> getCommentListByBoardId(int boardId);
    int getCommentCountByBoardId(int boardId);
    int updateComment(HashMap<String, Object> hashMap);
    CommentVO getOneCommentById(int dataId);
    int deleteComment(int dataId);
}
