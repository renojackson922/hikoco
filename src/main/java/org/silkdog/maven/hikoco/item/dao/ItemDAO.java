package org.silkdog.maven.hikoco.item.dao;

import org.silkdog.maven.hikoco.item.dto.ItemDTO;

import java.util.HashMap;
import java.util.List;

public interface ItemDAO {
    int insert(ItemDTO idto);
    List<HashMap> list();
    ItemDTO select(int itemId);
    List<HashMap> search(String searchValue);
    List<HashMap> listByIndex(HashMap map);
    int countFromList();
    List<HashMap> getSignatureItems();
}
