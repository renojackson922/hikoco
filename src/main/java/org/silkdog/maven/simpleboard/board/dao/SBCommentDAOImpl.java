package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;

import java.util.HashMap;
import java.util.List;

public class SBCommentDAOImpl implements SBCommentDAO {
    private SqlSessionTemplate sqlSessionTemplate;


    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public int insert(SBCommentVO sbCommentVO){
        return sqlSessionTemplate.insert("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.insert", sbCommentVO);
    }

    @Override
    public List<SBCommentVO> getCommentListByBoardId(int boardId) {
        return sqlSessionTemplate.selectList("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.getCommentListByBoardId", boardId);
    }

    @Override
    public int getCommentCountByBoardId(int boardId) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.getCommentCountByBoardId", boardId);
    }

    @Override
    public int updateComment(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.updateComment", hashMap);
    }

    @Override
    public SBCommentVO getOneCommentById(int dataId) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.getOneCommentById", dataId);
    }

    @Override
    public int deleteComment(int dataId) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.SBCommentDAO.deleteComment", dataId);
    }
}
