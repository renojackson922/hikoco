package org.silkdog.maven.hikoco.category.dao;

import org.silkdog.maven.hikoco.category.vo.CategoryVO;

import java.util.HashMap;
import java.util.List;

public interface CategoryDAO {
    List<HashMap> list();
    List<HashMap> listFirstIndent();
    List<HashMap> listByIndent(int i);
    int count(int i);
    int insert(CategoryVO cdto);
}
