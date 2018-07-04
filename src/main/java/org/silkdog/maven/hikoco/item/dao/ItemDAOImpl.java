package org.silkdog.maven.hikoco.item.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.item.vo.ItemVO;

import java.util.HashMap;
import java.util.List;

//@Repository
public class ItemDAOImpl implements ItemDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public List<HashMap> list(){
        List<HashMap> ilist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.item.dao.ItemDAO.list");
        return ilist;
    }

    @Override
    public int insert(final ItemVO idto){
        int result = sqlSessionTemplate.insert("org.silkdog.maven.hikoco.item.dao.ItemDAO.insert", idto);
        return result;
    }

    @Override
    public ItemVO select(int itemId){
        ItemVO idto = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.item.dao.ItemDAO.select", itemId);
        return idto;
    }

    @Override
    public List<HashMap> search(String searchValue){
        List<HashMap> ilist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.item.dao.ItemDAO.search", searchValue);
        return ilist;
    }

    /* 리스트를 인덱스로 받아오기 */
    @Override
    public List<HashMap> listByIndex(HashMap map){
        List<HashMap> ilist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.item.dao.ItemDAO.listByIndex", map);
        return ilist;
    }

    @Override
    public int countFromList(){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.item.dao.ItemDAO.countFromList");
    }

    @Override
    public void delete(int itemId){
        System.out.println(itemId);
        int result =  sqlSessionTemplate.delete("org.silkdog.maven.hikoco.item.dao.ItemDAO.delete", itemId);
    }


//    @Override
//    public List<HashMap> getSignatureItems(){
//        List<HashMap> ilistSig =  sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.item.dao.ItemDAO.getSignatureItems");
//        List<HashMap> ilistSigStack = null;
//        int cnt = ilistSig.size();
//        System.out.println("Amount of Counter: " + cnt);
//        System.out.println("GET 테스트 : " + ilistSig.get(0).get("item_id") );
//        for(int i = 0; i < cnt; i++) {
//            int tmp = (Integer)ilistSig.get(i).get("item_id");
//            ilistSigStack.add(sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.item.dao.ItemDAO.select", tmp));
//        }
//        return ilistSigStack;
//    }
}
