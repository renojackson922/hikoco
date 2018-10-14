package org.silkdog.maven.simpleboard.board.dao;

import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;

import java.util.HashMap;

public interface SBMemberDAO {
    int createAccount(SBMemberVO sbMemberVO);
    int login(HashMap<String, Object> hashMap);
    SBMemberVO getInfoByUsername(String username);
    /** 세개를 합칠 수도 있을 듯... */
    int isUsernameExists(String username);
    int isNicknameExists(String nickname);
    int isPhoneExists(String phone);
}
