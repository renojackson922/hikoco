package org.silkdog.maven.hikoco.mycart.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;

import java.util.HashMap;
import java.util.Map;

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
    public MyCartVO checkCartListByUserInfo(int memId, int itemId){
        /**
         *  해쉬맵 작업은 서비스에서 해야함. 수정필요!
         * */
        Map<String, Integer> map = new HashMap<>();
        map.put("mem_id", memId);
        map.put("item_id", itemId);
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.mycart.dao.MyCartDAO.checkCartListByUserInfo", map);
    }


}
