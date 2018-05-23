package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.dto.MemberDTO;

public interface MemberDAO {
    MemberDTO select();
    int insert(MemberDTO mdto);
}
