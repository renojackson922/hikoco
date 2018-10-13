package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.MemberVO;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public interface MemberDAO {
    int createAccount(MemberVO memberVO);
    int login(HashMap<String, Object> hashMap);
    MemberVO getInfoByUsername(String username);
}
