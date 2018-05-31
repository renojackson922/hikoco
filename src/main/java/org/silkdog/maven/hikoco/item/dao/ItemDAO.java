package org.silkdog.maven.hikoco.item.dao;

import org.silkdog.maven.hikoco.item.dto.ItemDTO;

import java.util.List;

public interface ItemDAO {
    int insert(ItemDTO idto);
    List<ItemDTO> list();
    List<ItemDTO> search();
}
