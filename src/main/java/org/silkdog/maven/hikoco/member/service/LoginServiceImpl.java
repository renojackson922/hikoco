package org.silkdog.maven.hikoco.member.service;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    protected final MemberDAO memberDAO;

    @Autowired
    public LoginServiceImpl(MemberDAO memberDAO){
        this.memberDAO = memberDAO;
    }

    @Override
    public void loginVerification(){

    }
}
