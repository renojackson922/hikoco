package org.silkdog.maven.hikoco.item.dao;

import org.silkdog.maven.hikoco.item.dto.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.util.List;

public class ItemDAOImpl implements ItemDAO {
    private JdbcTemplate jdbcTemplate;

    public ItemDAOImpl(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<ItemDTO> rowMapper = (rs, rowNum) -> {
      ItemDTO idto = new ItemDTO();
      idto.setItem_id(rs.getInt("item_id"));
      idto.setItem_title(rs.getString("item_title"));
      idto.setItem_price(rs.getInt("item_price"));
      idto.setItem_manu(rs.getString("item_manu"));
      idto.setItem_vendor(rs.getString("item_vendor"));
      idto.setItem_summary(rs.getString("item_summary"));
      idto.setItem_pic(rs.getString("item_pic"));
      idto.setItem_detail(rs.getString("item_detail"));
      idto.setItem_upload_date(rs.getDate("item_upload_date"));
      idto.setItem_last_edited_date(rs.getTimestamp("item_last_edited_date"));
      return idto;
    };

    @Override
    public List<ItemDTO> list(){
        List<ItemDTO> ilist = jdbcTemplate.query("SELECT * FROM HIKOCO_ITEM ORDER BY ITEM_ID ASC", rowMapper);
        return ilist;
    }

    @Override
    public int insert(final ItemDTO idto){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(conn -> {
            String sql = "INSERT INTO HIKOCO_ITEM (item_title, item_price, item_manu, item_vendor, item_summary, item_pic, item_detail, item_upload_date, item_last_edited_date) VALUES(?,?,?,?,?,?,?, now(), now())";
            PreparedStatement ps = conn.prepareStatement(sql, new String[]{"item_id"});
            ps.setString(1, idto.getItem_title());
            ps.setInt(2, idto.getItem_price());
            ps.setString(3, idto.getItem_manu());
            ps.setString(4, idto.getItem_vendor());
            ps.setString(5, idto.getItem_summary());
            ps.setString(6, idto.getItem_pic());
            ps.setString(7, idto.getItem_detail());
            return ps;
        }, keyHolder);
        Number idNum = keyHolder.getKey();
        return idNum.intValue();
    }

}
