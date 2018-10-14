package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.SBCategoryVO;

import java.util.List;

public class SBCategoryDAOImpl implements SBCategoryDAO {

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    private SqlSessionTemplate sqlSessionTemplate;


    @Override
    public List<SBCategoryVO> getAllCategoryList() {
        return sqlSessionTemplate.selectList("org.silkdog.maven.simpleboard.board.dao.SBCategoryDAO.getAllCategoryList");
    }
}
