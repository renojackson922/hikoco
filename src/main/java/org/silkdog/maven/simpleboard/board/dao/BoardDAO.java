package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.BoardVO;

import java.util.HashMap;
import java.util.List;

public interface BoardDAO {
    int insert(BoardVO boardVO);
    List<BoardVO> getList(HashMap<String, Object> hashMap);
    List<BoardVO> getAllList();
    List<BoardVO> getListByCategory(HashMap<String, Object> hashMap);
//    int insert(HashMap<String, Object> hashMap);
    int doBot(HashMap<String, Object> hashMap);
    BoardVO detailById(int id);
    int update(HashMap<String, Object> hashMap);
    int pageNumByCategory(int category);

//    int update(BoardVO boardVO);
}
