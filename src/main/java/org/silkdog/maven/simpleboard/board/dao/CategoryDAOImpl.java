package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.category.vo.CategoryVO;

import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    private SqlSessionTemplate sqlSessionTemplate;



    @Override
    public List<CategoryVO> getAllCategoryList() {
        return sqlSessionTemplate.selectList("org.silkdog.maven.simpleboard.board.dao.CategoryDAO.getAllCategoryList");
    }
}
