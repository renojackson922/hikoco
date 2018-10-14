package org.silkdog.maven.simpleboard.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;

import java.util.HashMap;

public class SBMemberDAOImpl implements SBMemberDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }


    @Override
    public int createAccount(SBMemberVO sbMemberVO) {
        return sqlSessionTemplate.insert("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.createAccount", sbMemberVO);
    }

    @Override
    public int login(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.login", hashMap);
    }

    @Override
    public SBMemberVO getInfoByUsername(String username) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.getInfoByUsername", username);
    }

    @Override
    public int isUsernameExists(String username) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.isUsernameExists", username);
    }

    @Override
    public int isNicknameExists(String nickname) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.isNicknameExists", nickname);
    }

    @Override
    public int isPhoneExists(String phone) {
        return sqlSessionTemplate.selectOne("org.silkdog.maven.simpleboard.board.dao.SBMemberDAO.isPhoneExists", phone);
    }
}
