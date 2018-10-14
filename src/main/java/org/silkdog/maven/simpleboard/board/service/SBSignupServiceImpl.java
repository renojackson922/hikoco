package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;

@Repository
@Qualifier("SBSignupServiceImpl")
public class SBSignupServiceImpl implements SBSignupService {
    @Autowired
    private SBMemberDAO sbMemberDAO;

    @Override
    public void addAddtionalInfo(SBMemberVO sbMemberVO) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        sbMemberVO.setRegdate(timestamp);
        sbMemberVO.setRegip("192.168.35.101");
        sbMemberVO.setLastLoginDate(timestamp);
        sbMemberVO.setLastLoginIp("192.168.35.101");

        sbMemberDAO.createAccount(sbMemberVO);
    }
}
