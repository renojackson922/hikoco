package org.silkdog.maven.hikoco.member.validator;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class LoginValidator implements Validator {
    /**
     *  컨트롤러 이외의 클래스에서 @Autowired 로 DAO를 가져오지 못하는 경우(bean 인식 불가, null)
     */
    protected final MemberDAO memberDAO;

    @Autowired
    public LoginValidator(MemberDAO memberDAO){
        this.memberDAO = memberDAO;
    }

    @Override
    public boolean supports(Class<?> clazz){
        return MemberVO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors){
        MemberVO memberVO = (MemberVO) target;

    }

}
