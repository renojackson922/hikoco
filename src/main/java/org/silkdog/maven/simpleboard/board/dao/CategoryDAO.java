package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.hikoco.category.vo.CategoryVO;

import java.util.List;

public interface CategoryDAO {
    List<CategoryVO> getAllCategoryList();
}
