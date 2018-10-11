package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;

import java.util.HashMap;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {
    private SqlSessionTemplate sqlSessionTemplate;


    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public int insert(CommentVO commentVO){
        return sqlSessionTemplate.insert("org.silkdog.maven.simpleboard.board.dao.CommentDAO.insert", commentVO);
    }

    @Override
    public List<CommentVO> getCommentListByBoardId(int boardId) {
        return sqlSessionTemplate.selectList("org.silkdog.maven.simpleboard.board.dao.CommentDAO.getCommentListByBoardId", boardId);
    }

    @Override
    public int getCommentCountByBoardId(int boardId) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.CommentDAO.getCommentCountByBoardId", boardId);
    }

    @Override
    public int updateComment(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.CommentDAO.updateComment", hashMap);
    }

    @Override
    public CommentVO getOneCommentById(int dataId) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.CommentDAO.getOneCommentById", dataId);
    }

    @Override
    public int deleteComment(int dataId) {
        return sqlSessionTemplate.update("org.silkdog.maven.simpleboard.board.dao.CommentDAO.deleteComment", dataId);
    }
}
