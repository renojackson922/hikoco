package org.silkdog.maven.hikoco;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.util.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml") // 임시
public class TestService{
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void test(){

        java.util.Date date = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

        MemberDTO mdto = new MemberDTO();
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



        if(result == 0){
            System.out.println("FUCK TRY AGAIN");
        }else{
            System.out.println("HELL YEAH!");
        }

//        HashMap<String, String> hashMap =  sqlSession.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.select");
//        if (hashMap != null) {
//            Set<Map.Entry<String, String>> set = hashMap.entrySet();
//            Iterator<Map.Entry<String, String>> it = set.iterator();
//            Map.Entry<String, String> e;
//            while(it.hasNext()){
//                e = it.next();
//                System.out.println(e.getKey() + ", " + String.valueOf(e.getValue()));  // !! 주목 !!
//            }
//
//            System.out.println("It is not null");
//        }else{
//            System.out.println("It is null, goddamnit!");
//        }



    }
}



//        Map<String, MemberDTO> MemberDTOHashMap = new HashMap<>(); // hashmap for date and the dto
//
//        Set<Map.Entry<String, MemberDTO>> entrySet = MemberDTOHashMap.entrySet();
//
//        for(Map.Entry<String, MemberDTO> entry : entrySet){
//            entry.getKey(); //your String key i.e. date in your case
//            entry.getValue(); //your DTO value for this key
//            System.out.println(entry.getKey() + ", " + entry.getValue());
//        }