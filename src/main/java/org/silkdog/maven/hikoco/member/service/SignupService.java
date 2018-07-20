package org.silkdog.maven.hikoco.member.service;

import org.silkdog.maven.hikoco.member.vo.MemberVO;

import java.util.HashMap;

public interface SignupService {
    void signupNewMember(MemberVO memberVO, HashMap<String, Object> map);
}
