package org.silkdog.maven.hikoco.item.dao;

import org.silkdog.maven.hikoco.item.vo.ItemVO;

import java.util.HashMap;
import java.util.List;

public interface ItemDAO {
    int insert(ItemVO idto);
    void delete(int itemId);
    List<HashMap> list();
    ItemVO select(int itemId);
    List<HashMap> search(String searchValue);
    List<HashMap> listByIndex(HashMap map);
    int countFromList();
    List<ItemVO> recentItemList();
//    List<HashMap> getSignatureItems();
}
