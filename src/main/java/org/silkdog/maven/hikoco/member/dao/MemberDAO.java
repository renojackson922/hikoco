package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.vo.MemberVO;

public interface MemberDAO {
    MemberVO select();
    MemberVO login(String id, String pw);
    int insert(MemberVO mdto);
}
