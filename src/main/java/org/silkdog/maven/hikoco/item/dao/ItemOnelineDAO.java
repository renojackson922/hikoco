package org.silkdog.maven.hikoco.item.dao;

import org.silkdog.maven.hikoco.item.vo.ItemOnelineVO;

import java.util.HashMap;
import java.util.List;

public interface ItemOnelineDAO {
    List<ItemOnelineVO> listByMemIdItemId(HashMap<String,Object> hashMap);
    List<ItemOnelineVO> listByItemId(int itemId);
    int isReviewExists(HashMap<String, Object> hashMap);
    int insert(ItemOnelineVO itemOnelineVO);
}
