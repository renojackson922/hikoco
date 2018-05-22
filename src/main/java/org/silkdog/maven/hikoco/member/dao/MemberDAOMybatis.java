package org.silkdog.maven.hikoco.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class MemberDAOMybatis implements MemberDAO {
    @Autowired
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public MemberDTO select(){
        MemberDTO mdto = (MemberDTO)sqlSession.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.select");
        return mdto;
    }
}
