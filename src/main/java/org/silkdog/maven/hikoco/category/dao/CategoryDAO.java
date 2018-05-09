package org.silkdog.maven.hikoco.category.dao;

import org.silkdog.maven.hikoco.category.dto.CategoryDTO;

import java.util.List;

public interface CategoryDAO {
    List<CategoryDTO> list();
    int count();
}
