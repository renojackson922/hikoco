package org.silkdog.maven.hikoco.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.member.vo.MemberMinifiedVO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.silkdog.maven.hikoco.member.vo.ProfileImageVO;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
    public void saveProfileImage(HashMap<String, Object> map){
        sqlSessionTemplate.insert("org.silkdog.maven.hikoco.member.dao.MemberDAO.saveProfileImage", map);
    }

    @Override
    public HashMap<String, Object> getByteImage(int id) {
        return sqlSessionTemplate.selectOne("        /* 이메일 중복 여부 검사 */", id);
    }

//    @Override
//    public ArrayList<Integer> getByteImageIdx(){
//        return sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.member.dao.MemberDAO.getByteImageIdx");
//    }

    @Override
    public int isUseridExists(String userid){
        int count = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.isUseridExists", userid);
        System.out.println(count);
        return count;
    }

    @Override
    public int isNicknameExists(String nickname){
        int count = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.isNicknameExists", nickname);
        System.out.println(count);
        return count;
    }

    @Override
    public int isPhoneExists(String phone){
        int count = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.isPhoneExists", phone);
        System.out.println(count);
        return count;
    }

    @Override
    public MemberMinifiedVO getMemberByUserid(String userid){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.getMemberByUserid", userid);
    }

    @Override
    public MemberVO getFullMemberByUserid(String userid){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.getFullMemberByUserid", userid);
    }

    @Override
    public MemberVO getFullMemberById(int id){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.getFullMemberById", id);
    }

    @Override
    public List<MemberVO> memberList(){
        return sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.member.dao.MemberDAO.memberList");
    }

    @Override
    public List<MemberVO> recentMemberList(){
        return sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.member.dao.MemberDAO.recentMemberList");
    }

    /*
    @Override
    public ProfileImageVO getByteImageById(int id){
        ProfileImageVO profileImageVO = sqlSessionTemplate.selectOne( "org.silkdog.maven.hikoco.member.dao.MemberDAO.getByteImageById",id);
        return profileImageVO;
    }
    */

}
