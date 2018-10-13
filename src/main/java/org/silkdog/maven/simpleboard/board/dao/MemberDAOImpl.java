package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.MemberVO;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class MemberDAOImpl implements MemberDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }


    @Override
    public int createAccount(MemberVO memberVO) {
        return sqlSessionTemplate.insert("org.silkdog.maven.simpleboard.board.dao.MemberDAO.createAccount", memberVO);
    }

    @Override
    public int login(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.MemberDAO.login", hashMap);
    }

    @Override
    public MemberVO getInfoByUsername(String username) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.MemberDAO.getInfoByUsername", username);
    }
}
