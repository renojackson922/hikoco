package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.SBCategoryVO;

import java.util.List;

public interface SBCategoryDAO {
    List<SBCategoryVO> getAllCategoryList();
}
