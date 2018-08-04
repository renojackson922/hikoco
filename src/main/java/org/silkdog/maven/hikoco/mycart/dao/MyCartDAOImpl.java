package org.silkdog.maven.hikoco.mycart.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;

import java.util.HashMap;
import java.util.List;

public class MyCartDAOImpl implements MyCartDAO {
    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public int addToMyCart(MyCartVO myCartVO){
        return sqlSessionTemplate.insert("org.silkdog.maven.hikoco.mycart.dao.MyCartDAO.addToMyCart", myCartVO);
    }

    @Override
    public int checkCartListByUserInfo(HashMap<String, Object> hashMap){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.mycart.dao.MyCartDAO.checkCartListByUserInfo", hashMap);
    }

    @Override
    public void updateMyCart(HashMap<String, Object> hashMap) {
        sqlSessionTemplate.update("org.silkdog.maven.hikoco.mycart.dao.MyCartDAO.updateMyCart", hashMap);
    }

    @Override
    public List<MyCartVO> myCartList(int memId) {
        return sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.mycart.dao.MyCartDAO.myCartList", memId);
    }


}
