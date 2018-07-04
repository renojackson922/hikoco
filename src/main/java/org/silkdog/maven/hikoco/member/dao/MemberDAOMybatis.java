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
    public int insert(MemberVO mdto){
        java.util.Date date = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

//        MemberDTO mdto = new MemberDTO();
        mdto.setMem_userid("B");
        mdto.setMem_password("b");
        mdto.setMem_realname("B");
        mdto.setMem_nickname("B");
        mdto.setMem_photo("b");
        mdto.setMem_tier("Diamond");
        mdto.setMem_phone("01012345678");
        mdto.setMem_birthday("19900101");
        mdto.setMem_sex(1);
        mdto.setMem_zipcode("06700");
        mdto.setMem_addr1("BB");
        mdto.setMem_addr2("BB");
        mdto.setMem_addr3("BB");
        mdto.setMem_addr4("BB");
        mdto.setMem_regdate(timestamp);
        mdto.setMem_lastlogin_datetime(timestamp);
        mdto.setMem_lastlogin_ip("127.0.0.1");
        int result = sqlSessionTemplate.insert("org.silkdog.maven.hikoco.member.dao.MemberDAO.insert", mdto);

        return result;
    }
}
