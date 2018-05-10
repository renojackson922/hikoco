package org.silkdog.maven.hikoco.member.jdbc;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
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
import java.util.List;

// 아마 이게 Impl 이 담당하는 것 일듯
public class JdbcTemplateMemberDAO implements MemberDAO {
    private JdbcTemplate jdbcTemplate;

    public JdbcTemplateMemberDAO(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<MemberDTO> rowMapper = (rs, rowNum) -> {
        MemberDTO mdto = new MemberDTO();
        mdto.setMem_id(rs.getInt("mem_id"));
        mdto.setMem_userid(rs.getString("mem_userid"));
        mdto.setMem_password(rs.getString("mem_password"));
        mdto.setMem_realname(rs.getString("mem_realname"));
        mdto.setMem_nickname(rs.getString("mem_nickname"));
        mdto.setMem_photo(rs.getString("mem_photo"));
        mdto.setMem_tier(rs.getString("mem_tier"));
        mdto.setMem_phone(rs.getString("mem_phone"));
        mdto.setMem_birthday(rs.getString("mem_birthday"));
        mdto.setMem_sex(rs.getInt("mem_sex"));
        mdto.setMem_zipcode(rs.getString("mem_zipcode"));
        mdto.setMem_addr1(rs.getString("mem_addr1"));
        mdto.setMem_addr2(rs.getString("mem_addr2"));
        mdto.setMem_addr3(rs.getString("mem_addr3"));
        mdto.setMem_addr4(rs.getString("mem_addr4"));
        mdto.setMem_regdate(rs.getString("mem_regdate"));
        mdto.setMem_lastlogin_datetime(rs.getString("mem_lastlogin_datetime"));
        mdto.setMem_lastlogin_ip(rs.getString("mem_lastlogin_ip"));
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

    @Override
    public int insert(MemberDTO mdto){
        String sql = "INSERT INTO HIKOCO_MEMBER VALUES(HIKOCO_MEMBER_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,sysdate,'0')";
        Object[] values = new Object[]{mdto.getMem_userid(), mdto.getMem_password(), mdto.getMem_realname(), mdto.getMem_nickname(),
                        mdto.getMem_photo(), mdto.getMem_tier(), mdto.getMem_phone(), mdto.getMem_birthday(), mdto.getMem_sex(),
                        mdto.getMem_zipcode(), mdto.getMem_addr1(), mdto.getMem_addr2(), mdto.getMem_addr3(), mdto.getMem_addr4()};
        int result = jdbcTemplate.update(sql, values);
        return result;
    }

//    @Override
//    public int insert(MemberDTO mdto){
//        KeyHolder keyHolder = new GeneratedKeyHolder();
//        jdbcTemplate.update(conn -> {
//            String sql = "INSERT INTO HIKOCO_MEMBER VALUES(HIKOCO_MEMBER_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,sysdate,'0')";
//            String[] values = new String[]{"mem_id", "mem_regdate", "mem_lastlogin_datetime", "mem_lastlogin_ip"};
//            PreparedStatement ps = conn.prepareStatement(sql, values); // 자동생성되는 키 칼럼을 삽입
//            ps.setString(1, mdto.getMem_userid());
//            ps.setString(2, mdto.getMem_password());
//            ps.setString(3, mdto.getMem_realname());
//            ps.setString(4, mdto.getMem_nickname());
//            ps.setString(5, mdto.getMem_photo());
//            ps.setString(6, mdto.getMem_tier());
//            ps.setString(7, mdto.getMem_phone());
//            ps.setString(8, mdto.getMem_birthday());
//            ps.setInt(9, mdto.getMem_sex());
//            ps.setString(10, mdto.getMem_zipcode());
//            ps.setString(11, mdto.getMem_addr1());
//            ps.setString(12, mdto.getMem_addr2());
//            ps.setString(13, mdto.getMem_addr3());
//            ps.setString(14, mdto.getMem_addr4());
//            return ps;
//        }, keyHolder);
//        Number idNum = keyHolder.getKey();
//        return idNum.intValue();
//    }
}

