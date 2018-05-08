package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.dto.MemberDTO;

import java.util.List;

public interface MemberDAO {
    List<MemberDTO> select();
}
