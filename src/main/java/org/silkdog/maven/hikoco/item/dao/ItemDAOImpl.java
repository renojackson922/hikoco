package org.silkdog.maven.hikoco.item.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.item.dto.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

//@Repository
public class ItemDAOImpl implements ItemDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }


//    private RowMapper<ItemDTO> rowMapper = (rs, rowNum) -> {
//      ItemDTO idto = new ItemDTO();
//      idto.setItem_id(rs.getInt("item_id"));
//      idto.setItem_title(rs.getString("item_title"));
//      idto.setItem_price(rs.getInt("item_price"));
//      idto.setItem_manu(rs.getString("item_manu"));
//      idto.setItem_vendor(rs.getString("item_vendor"));
//      idto.setItem_summary(rs.getString("item_summary"));
//      idto.setItem_pic(rs.getString("item_pic"));
//      idto.setItem_detail(rs.getString("item_detail"));
//      idto.setItem_upload_date(rs.getDate("item_upload_date"));
//      idto.setItem_last_edited_date(rs.getTimestamp("item_last_edited_date"));
//      return idto;
//    };


    @Override
    public List<HashMap> list(){
        List<HashMap> ilist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.item.dao.ItemDAO.list");
        return ilist;
    }

    @Override
    public int insert(final ItemDTO idto){
        int result = sqlSessionTemplate.insert("org.silkdog.maven.hikoco.item.dao.ItemDAO.insert", idto);
        return result;
    }

    @Override
    public ItemDTO select(int itemId){
        ItemDTO idto = sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.item.dao.ItemDAO.select", itemId);
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
