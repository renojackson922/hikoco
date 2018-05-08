package org.silkdog.maven.hikoco.transaction.jdbc;

import org.silkdog.maven.hikoco.transaction.dao.TransactionDAO;
import org.silkdog.maven.hikoco.transaction.dto.TransactionDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcTemplateTransactionDAO implements TransactionDAO {
    private JdbcTemplate jdbcTemplate;
    public JdbcTemplateTransactionDAO(DataSource dataSource){ jdbcTemplate = new JdbcTemplate(dataSource); }


    public RowMapper<TransactionDTO> rowMapper = (rs, rowNum) -> {
        TransactionDTO tdto = new TransactionDTO();
        tdto.setNo(rs.getInt("no"));
        tdto.setSeller(rs.getString("seller"));
        tdto.setPurchaser_rn(rs.getString("purchaser_rn"));
        tdto.setPurchaser_id(rs.getString("purchaser_id"));
        tdto.setPurdate(rs.getString("purdate"));
        tdto.setItemno(rs.getInt("itemno"));
        tdto.setItemname(rs.getString("itemname"));
        tdto.setItemcost_original(rs.getInt("itemcost_original"));
        tdto.setItemcost_actual(rs.getInt("itemcost_actual"));
        tdto.setIs_discount(rs.getString("is_discount"));
        tdto.setExtrainfo(rs.getString("extrainfo"));
        tdto.setShip_status(rs.getString("ship_status"));
        return tdto;
    };

    @Override
    public TransactionDTO selectOne(){
        TransactionDTO tdto = jdbcTemplate.queryForObject("select * from HIKOCO_TX where NO = 1", rowMapper);
        return tdto;
    }

}
