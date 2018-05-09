package org.silkdog.maven.hikoco.member.jdbc;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

// 아마 이게 Impl 이 담당하는 것 일듯
public class JdbcTemplateMemberDAO implements MemberDAO {
    private JdbcTemplate jdbcTemplate;

    public JdbcTemplateMemberDAO(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<MemberDTO> rowMapper = (rs, rowNum) -> {
        MemberDTO mdto = new MemberDTO();
        mdto.setNo(rs.getInt("no"));
        mdto.setId(rs.getString("id"));
        mdto.setPw(rs.getString("pw"));
        mdto.setJoindate(rs.getString("joindate"));
        return mdto;
    };

    @Override
    public List<MemberDTO> select(){
        List<MemberDTO> mlist = jdbcTemplate.query("select * from HIKOCO_MEMBER order by NO desc", rowMapper);
        return mlist;
    }

    @Override
    public MemberDTO selectOne(){
        MemberDTO mdto = jdbcTemplate.queryForObject("select * from HIKOCO_MEMBER where NO = 1", rowMapper);
        return mdto;
    }

}
