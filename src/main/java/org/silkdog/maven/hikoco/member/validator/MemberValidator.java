package org.silkdog.maven.hikoco.member.validator;

import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.net.InetAddress;
import java.util.regex.Pattern;

public class MemberValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz){
        return MemberVO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors){
        MemberVO memberVO = (MemberVO) target;
        if(memberVO.getUserid() == null || memberVO.getUserid().trim().isEmpty())
            errors.rejectValue("userid", "required");

        /* 이메일 형식 준수 검사 */
        boolean isUseridQualify = Pattern.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", memberVO.getUserid());
        if(!isUseridQualify) errors.rejectValue("userid", "useridNotQualify");


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "realname", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "required");

        /* 실명 한글 검사 */
        boolean isRealnameKor = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", memberVO.getRealname());
        if(!isRealnameKor) errors.rejectValue("realname", "notKorean");

        /* 성별 검사 */
        if(memberVO.getSex() == 0 || 0 == memberVO.getSex()) errors.rejectValue("sex", "sexNotSelected");

        if(memberVO.hasPassword()){
            if(memberVO.getPassword().length() < 5)
                errors.rejectValue("password", "shortPassword");
            else if(!memberVO.isSamePasswordConfirmPassword())
                errors.rejectValue("passwordConfirm", "notSame");
        }
        /*

        Address address = memberVO.getAddress();
        if(address == null){
            errors.rejectValue("address", "required");
        } else {
            errors.pushNestedPath("address");
            try{
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address1", "required");
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address2", "required");
            } finally {
                errors.popNestedPath();
            }
        }

        */
    }
}
