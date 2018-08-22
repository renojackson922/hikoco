package org.silkdog.maven.hikoco.item.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.item.vo.ItemOnelineVO;

import java.util.HashMap;
import java.util.List;

public class ItemOnelineDAOImpl implements ItemOnelineDAO {
    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public List<ItemOnelineVO> listByMemIdItemId(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.hikoco.item.dao.ItemOnelineDAO.listByMemIdItemId", hashMap);
    }

    @Override
    public List<ItemOnelineVO> listByItemId(int itemId) {
        return sqlSessionTemplate.
                selectList("org.silkdog.maven.hikoco.item.dao.ItemOnelineDAO.listByItemId", itemId);
    }

    @Override
    public int isReviewExists(HashMap<String, Object> hashMap) {
        return sqlSessionTemplate.
                selectOne("org.silkdog.maven.hikoco.item.dao.ItemOnelineDAO.isReviewExists", hashMap);
    }

    @Override
    public int insert(ItemOnelineVO itemOnelineVO) {
        return sqlSessionTemplate.
                insert("org.silkdog.maven.hikoco.item.dao.ItemOnelineDAO.insert", itemOnelineVO);
    }
}
