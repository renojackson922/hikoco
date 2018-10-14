package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;

import java.util.HashMap;
import java.util.List;

public interface SBBoardDAO {
    int insert(SBBoardVO sbBoardVO);
    List<SBBoardVO> getList(HashMap<String, Object> hashMap);
    List<SBBoardVO> getAllList();
    List<SBBoardVO> getListByCategory(HashMap<String, Object> hashMap);
    List<SBBoardVO> getAnnounceListByCategory(int category);
    int getListCountByCategory(int category);
//    int insert(HashMap<String, Object> hashMap);
    int doBot(HashMap<String, Object> hashMap);
    SBBoardVO detailById(int id);
    int update(HashMap<String, Object> hashMap);
    int pageNumByCategory(int category);
    int addCommentCntToBoard(int boardId);
    int subtractCommentCntToBoard(int boardId);
    int addHit(int boardId);

//    int update(BoardVO boardVO);
}
