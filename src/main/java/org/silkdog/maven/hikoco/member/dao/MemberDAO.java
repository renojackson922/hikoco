package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.vo.MemberVO;

import java.util.HashMap;

public interface MemberDAO {
    MemberVO select();
    int login(String id, String pw);
    int insert(MemberVO memberVO);
    int isduplicated(String userid);
}
