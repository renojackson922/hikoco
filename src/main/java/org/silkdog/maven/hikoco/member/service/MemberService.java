package org.silkdog.maven.hikoco.member.service;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberMinifiedVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    protected final MemberDAO memberDAO;

    @Autowired
    public MemberService(MemberDAO memberDAO){
        this.memberDAO = memberDAO;
    }

    public MemberMinifiedVO getMemberInfoByEmail(String userid) {
        MemberMinifiedVO memberMinifiedVO = memberDAO.getMemberByUserid(userid);
        if(memberMinifiedVO != null){
            return memberMinifiedVO;
        }else{
            return null;
        }
    }
}
