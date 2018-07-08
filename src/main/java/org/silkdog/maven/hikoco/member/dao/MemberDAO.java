package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.vo.MemberVO;

import java.util.HashMap;

public interface MemberDAO {
    MemberVO select();
    MemberVO login(String id, String pw);
    int insert(HashMap map);
    int isduplicated(String userid);
}
