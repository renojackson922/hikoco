package org.silkdog.maven.hikoco;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class testDAOImpl implements testDAO {

    @Autowired
    private SqlSession sqlSession;

    public List findById() {
        testXMLmapper mapper = sqlSession.getMapper(testXMLmapper.class);
        return mapper.findById();
    }
}