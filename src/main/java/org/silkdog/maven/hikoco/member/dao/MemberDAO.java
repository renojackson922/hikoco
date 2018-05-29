package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.dto.MemberDTO;

public interface MemberDAO {
    MemberDTO select();
    MemberDTO login(String id, String pw);
    int insert(MemberDTO mdto);
}
