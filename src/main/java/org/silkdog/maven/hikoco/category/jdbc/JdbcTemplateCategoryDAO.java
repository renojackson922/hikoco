package org.silkdog.maven.hikoco.category.jdbc;

import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.util.List;

public class JdbcTemplateCategoryDAO implements CategoryDAO {
    private JdbcTemplate jdbcTemplate;

    public JdbcTemplateCategoryDAO(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<CategoryDTO> rowMapper = (rs, rowNum) -> {
        CategoryDTO cdto = new CategoryDTO();
        cdto.setHic_id(rs.getInt("hic_id"));
        cdto.setHic_val(rs.getString("hic_val"));
        cdto.setHic_parent(rs.getString("hic_parent"));
        cdto.setHic_order(rs.getInt("hic_order"));
        return cdto;
    };

    @Override
    public List<CategoryDTO> list(){
        List<CategoryDTO> clist = jdbcTemplate.query("select * from hikoco_item_cat order by hic_order asc, hic_id asc;", rowMapper);
        return clist;
    }

    @Override
    public int count(){
        return jdbcTemplate.queryForObject("SELECT COUNT(hic_id) FROM HIKOCO_ITEM_CAT", Integer.class);
    }
}

