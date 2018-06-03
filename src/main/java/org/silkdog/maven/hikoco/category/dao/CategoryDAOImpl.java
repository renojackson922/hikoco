package org.silkdog.maven.hikoco.category.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;

import java.util.HashMap;
import java.util.List;


public class CategoryDAOImpl implements CategoryDAO {
    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /*
    private RowMapper<CategoryDTO> rowMapper = (rs, rowNum) -> {
        CategoryDTO cdto = new CategoryDTO();
        cdto.setHic_id(rs.getInt("hic_id"));
        cdto.setHic_val(rs.getString("hic_val"));
        cdto.setHic_parent(rs.getString("hic_parent"));
        cdto.setHic_order(rs.getInt("hic_order"));
        cdto.setHic_indent(rs.getInt("hic_indent"));
        return cdto;
    };
*/

    @Override
    public List<HashMap> list() {
        List<HashMap> clist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.category.CategoryDAO.list");
        return clist;
    }

    @Override
    public List<HashMap> listFirstIndent(){
        List<HashMap> clist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.category.CategoryDAO.listFirstIndent");
        return clist;
    }

    @Override
    public List<HashMap> listByIndent(int i){
        List<HashMap> clist = sqlSessionTemplate.selectList("org.silkdog.maven.hikoco.category.CategoryDAO.listByIndent", i);
        return clist;
    }

    @Override
    public int count(int i){
        return sqlSessionTemplate.selectOne("org.silkdog.maven.hikoco.category.CategoryDAO.count", i);
    }

    @Override
    public int insert(final CategoryDTO cdto){
        return sqlSessionTemplate.insert("org.silkdog.maven.hikoco.category.CategoryDAO.insert" ,cdto);
    }

}

