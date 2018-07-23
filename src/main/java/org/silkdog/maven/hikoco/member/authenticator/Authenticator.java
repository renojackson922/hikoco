package org.silkdog.maven.hikoco.member.authenticator;

import org.silkdog.maven.hikoco.member.service.MemberService;
import org.silkdog.maven.hikoco.member.vo.MemberMinifiedVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Authenticator {
    @Autowired
    private MemberService memberService;

    public Authenticator(MemberService memberService) {
        this.memberService = memberService;
    }

    public Auth authenticate(String email, String password) {
        MemberMinifiedVO memberMinifiedVO = memberService.getMemberInfoByEmail(email);
        final String sha1 = org.apache.commons.codec.digest.DigestUtils.sha1Hex(password);
        if (memberMinifiedVO == null)
            throw new AuthenticationException();
        if (!memberMinifiedVO.matchPassword(sha1))
            throw new AuthenticationException();

        return new Auth(memberMinifiedVO.getId(), memberMinifiedVO.getUserid(), memberMinifiedVO.getNickname());
    }
}
