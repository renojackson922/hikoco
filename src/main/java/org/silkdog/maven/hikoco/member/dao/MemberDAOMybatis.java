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

//    @Override
//    public int login(String id, String pw){
//        HashMap<String, String> hashMap = new HashMap<String, String>();
//        hashMap.put(id, pw);
//
//        int result = sqlSession.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.select", hashMap);
//        if(result == 0){
//            return 0;
//        }else{
//            return 1;
//        }
//    }

    @Override
    public int insert(MemberDTO mdto){
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
        int result = sqlSession.insert("org.silkdog.maven.hikoco.member.dao.MemberDAO.insert", mdto);

        return result;
    }
}
