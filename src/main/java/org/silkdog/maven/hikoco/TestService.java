package org.silkdog.maven.hikoco;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml") // 임시
public class TestService{
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void test(){
        HashMap<String, String> hashMap =  sqlSession.selectOne("org.silkdog.maven.hikoco.member.dao.MemberDAO.select");
        if (hashMap != null) {
            Set<Map.Entry<String, String>> set = hashMap.entrySet();
            Iterator<Map.Entry<String, String>> it = set.iterator();
            Map.Entry<String, String> e;
            while(it.hasNext()){
                e = it.next();
                System.out.println(e.getKey() + ", " + String.valueOf(e.getValue()));  // !! 주목 !!
            }

            System.out.println("It is not null");
        }else{
            System.out.println("It is null, goddamnit!");
        }
    }
}
