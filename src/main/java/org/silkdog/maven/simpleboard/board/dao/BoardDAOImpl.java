package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;

import java.util.HashMap;
import java.util.List;

public class BoardDAOImpl implements BoardDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int insert(BoardVO boardVO) {
        return sqlSessionTemplate.
                insert("org.silkdog.maven.simpleboard.board.dao.BoardDAO.insert", boardVO);
    }
//    public int insert(HashMap<String, Object> hashMap) {
//        return sqlSessionTemplate.
//                insert("org.silkdog.maven.simpleboard.board.dao.BoardDAO.insert", hashMap);
//    }

    @Override
    public List<BoardVO> getList(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.BoardDAO.getList", hashMap);
    }

    @Override
    public List<BoardVO> getAllList() {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.BoardDAO.getAllList");
    }

    @Override
    public List<BoardVO> getListByCategory(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.BoardDAO.getListByCategory", hashMap);
    }

    @Override
    public int doBot(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                insert("org.silkdog.maven.simpleboard.board.dao.BoardDAO.doBot", hashMap);
    }

    @Override
    public BoardVO detailById(int id) {
        return sqlSessionTemplate.
                selectOne("org.silkdog.maven.simpleboard.board.dao.BoardDAO.detailById", id);
    }

//    @Override
//    public int update(BoardVO boardVO) {
//        return sqlSessionTemplate.
//                update("org.silkdog.maven.simpleboard.board.dao.BoardDAO.update", boardVO);
//    }

    @Override
    public int update(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                update("org.silkdog.maven.simpleboard.board.dao.BoardDAO.update", hashMap);
    }

    @Override
    public int pageNumByCategory(int category) {
        return sqlSessionTemplate.
                selectOne("org.silkdog.maven.simpleboard.board.dao.BoardDAO.pageNumByCategory", category);
    }
}
