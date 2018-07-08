package org.silkdog.maven.hikoco.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class MemberDAOMybatis implements MemberDAO {
    /*
    - aikocandy -
     Since sqlSessionTemplate is inheriting sqlSession Interface,
     it is okay to use sqlSession type instead.
    */
    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public MemberVO select(){
        MemberVO mdto = (MemberVO)sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.select");
        return mdto;
    }

    @Override
    public MemberVO login(String id, String pw){
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("mem_userid", id);
        hashMap.put("mem_password", pw);

        MemberVO mdto;
        try{
             mdto = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.login", hashMap);
             return mdto;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public int insert(HashMap map){
        int result = sqlSessionTemplate.insert("org.silkdog.maven.hikoco.member.dao.MemberDAO.insert", map);

        return result;
    }

    @Override
    public int isduplicated(String userid){
        int result = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.isduplicated", userid);

        return result;
    }
}
