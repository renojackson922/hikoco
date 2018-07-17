package org.silkdog.maven.hikoco.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.logging.Logger;

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
    public int login(String id, String pw){
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("mem_userid", id);
        hashMap.put("mem_password", pw);

        MemberVO mdto;

        try{
            mdto = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.login", hashMap);
            if(mdto.getUserid().equals(id) && mdto.getPassword().equals(pw)){
                System.out.println("Identification: True");
                return 1;
            }else{
                System.out.println("Identification: False");
                return -1;
            }
        }catch(Exception e){
//            e.printStackTrace();
            System.err.println(e.getMessage() + "Identification: Error");
            return -1;
        }
    }

    @Override
    public int insert(MemberVO memberVO){
        Timestamp t = new Timestamp(System.currentTimeMillis());
        memberVO.setRegdate(t);
        memberVO.setLastlogin_datetime(t);
        memberVO.setLastlogin_ip("0.0.0.0");
        int result = sqlSessionTemplate.insert("org.silkdog.maven.hikoco.member.dao.MemberDAO.insert", memberVO);

        return result;
    }

    @Override
    public int isduplicated(String userid){
        int result = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.isduplicated", userid);

        return result;
    }
}
