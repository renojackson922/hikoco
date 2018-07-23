package org.silkdog.maven.hikoco.member.service;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// crud를 응용 조합하는 부분이 서비스.
@Service
public class SignupServiceImpl implements SignupService {
    protected final MemberDAO memberDAO;

    @Autowired
    public SignupServiceImpl(MemberDAO memberDAO){
        this.memberDAO = memberDAO;
    }

    @Override
    public void signupNewMember(MemberVO memberVO){
        final String password = memberVO.getPassword();
        final String sha1 = org.apache.commons.codec.digest.DigestUtils.sha1Hex(password);
        memberVO.setPassword(sha1);

        memberDAO.insert(memberVO);
//        /* https://okky.kr/article/370609 */
//        memberVO.setUserid(map.get("userid").toString());
//        memberVO.setPassword(map.get("password").toString());
//        memberVO.setPasswordConfirm(map.get("passwordConfirm").toString());
//        memberVO.setRealname(map.get("realname").toString());
//        memberVO.setNickname(map.get("nickname").toString());
//        memberVO.setPhoto(map.get("photo").toString());
//        memberVO.setTier(map.get("tier").toString());
//        memberVO.setPhone(map.get("phone").toString());
//        memberVO.setBirthday(map.get("birthday").toString());
//        memberVO.setSex(Integer.parseInt(map.get("sex").toString()));
//        memberVO.setZipcode(map.get("zipcode").toString());
//        memberVO.setAddr1(map.get("addr1").toString());
//        memberVO.setAddr2(map.get("addr2").toString());
//        memberVO.setAddr3(map.get("addr3").toString());
//        memberVO.setAddr4(map.get("addr4").toString());
//
//        Timestamp t = new Timestamp(System.currentTimeMillis());
//
//        memberVO.setRegdate(t);
//        memberVO.setLastlogin_datetime(t);
//
//        memberVO.setLastlogin_ip("0.0.0.0");
//
//        memberDAO.insert(memberVO);
    }
}
