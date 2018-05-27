package org.silkdog.maven.hikoco.category.dao;

import org.silkdog.maven.hikoco.category.dao.CategoryDAO;
import org.silkdog.maven.hikoco.category.dto.CategoryDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    private JdbcTemplate jdbcTemplate;

    public CategoryDAOImpl(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<CategoryDTO> rowMapper = (rs, rowNum) -> {
        CategoryDTO cdto = new CategoryDTO();
        cdto.setHic_id(rs.getInt("hic_id"));
        cdto.setHic_val(rs.getString("hic_val"));
        cdto.setHic_parent(rs.getString("hic_parent"));
        cdto.setHic_order(rs.getInt("hic_order"));
        cdto.setHic_indent(rs.getInt("hic_indent"));
        return cdto;
    };

    @Override
    public List<CategoryDTO> list(){
        List<CategoryDTO> clist = jdbcTemplate.query("select * from hikoco_item_cat order by hic_order asc, hic_id asc;", rowMapper);
        return clist;
    }

    @Override
    public List<CategoryDTO> listFirstIndent(){
        List<CategoryDTO> clist = jdbcTemplate.query("select * from hikoco_item_cat where hic_indent = 1 order by hic_order asc, hic_id asc;", rowMapper);
        return clist;
    }


    @Override
    public List<CategoryDTO> listByIndent(int i){
        List<CategoryDTO> clist = jdbcTemplate.query("select * from hikoco_item_cat where hic_indent = " + i + " order by hic_order asc, hic_id asc;", rowMapper);
        return clist;
    }


    @Override
    public int insert(final CategoryDTO cdto){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(conn -> {
            String sql = "INSERT INTO HIKOCO_ITEM_CAT (hic_val, hic_parent, hic_order, hic_indent) values (?,?, (SELECT hic_order from HIKOCO_ITEM_CAT HIC_SUB where hic_id = ?), ((SELECT hic_indent+1 from HIKOCO_ITEM_CAT HIC_SUB2 where hic_id=?)));";
            PreparedStatement ps = conn.prepareStatement(sql, new String[]{"hic_id"});
            ps.setString(1, cdto.getHic_val());
            ps.setString(2, cdto.getHic_parent());
            ps.setInt(3, Integer.parseInt(cdto.getHic_parent()));
            ps.setString(4, cdto.getHic_parent());
            return ps;
        }, keyHolder);
        Number idNum = keyHolder.getKey();
        return idNum.intValue();
    }

    @Override
    public int count(int i){
        return jdbcTemplate.queryForObject("SELECT COUNT(hic_id) FROM HIKOCO_ITEM_CAT WHERE HIC_INDENT = " + i , Integer.class);
    }
}

