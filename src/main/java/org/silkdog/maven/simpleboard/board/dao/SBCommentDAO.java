package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;

import java.util.HashMap;
import java.util.List;

public interface SBCommentDAO {
    int insert(SBCommentVO sbCommentVO);
    List<SBCommentVO> getCommentListByBoardId(int boardId);
    int getCommentCountByBoardId(int boardId);
    int updateComment(HashMap<String, Object> hashMap);
    SBCommentVO getOneCommentById(int dataId);
    int deleteComment(int dataId);
}
