package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;

import java.util.HashMap;
import java.util.List;

public class SBBoardDAOImpl implements SBBoardDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int insert(SBBoardVO sbBoardVO) {
        return sqlSessionTemplate.
                insert("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.insert", sbBoardVO);
    }
//    public int insert(HashMap<String, Object> hashMap) {
//        return sqlSessionTemplate.
//                insert("org.silkdog.maven.simpleboard.board.dao.BoardDAO.insert", hashMap);
//    }

    @Override
    public List<SBBoardVO> getList(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.getList", hashMap);
    }

    @Override
    public List<SBBoardVO> getAllList() {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.getAllList");
    }

    @Override
    public List<SBBoardVO> getListByCategory(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.getListByCategory", hashMap);
    }

    @Override
    public List<SBBoardVO> getAnnounceListByCategory(int category) {
        return sqlSessionTemplate.
            selectList("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.getAnnounceListByCategory", category);
    }

    @Override
    public int getListCountByCategory(int category){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.getListCountByCategory", category);
    }

    @Override
    public int doBot(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                insert("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.doBot", hashMap);
    }

    @Override
    public SBBoardVO detailById(int id) {
        return sqlSessionTemplate.
                selectOne("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.detailById", id);
    }

//    @Override
//    public int update(BoardVO boardVO) {
//        return sqlSessionTemplate.
//                update("org.silkdog.maven.simpleboard.board.dao.BoardDAO.update", boardVO);
//    }

    @Override
    public int update(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                update("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.update", hashMap);
    }

    @Override
    public int pageNumByCategory(int category) {
        return sqlSessionTemplate.
                selectOne("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.pageNumByCategory", category);
    }

    @Override
    public int addCommentCntToBoard(int boardId) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.addCommentCntToBoard", boardId);
    }

    @Override
    public int subtractCommentCntToBoard(int boardId) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.subtractCommentCntToBoard", boardId);
    }

    @Override
    public int addHit(int boardId) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.SBBoardDAO.addHit", boardId);
    }
}


