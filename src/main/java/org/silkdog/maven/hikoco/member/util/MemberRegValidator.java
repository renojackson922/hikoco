package org.silkdog.maven.hikoco.member.util;

import org.springframework.validation.Errors;

import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;


public class MemberRegValidator implements Validator {
    /* 오류 검증을 지원하는지 확인하는 메소드 */
    @Override
    public boolean supports(Class<?> clazz) {
        return MemberRegRequest.class.isAssignableFrom(clazz);
    }

    /* 오류 검증 시작 */
    @Override
    public void validate(Object target, Errors errors){
        MemberRegRequest regReq = (MemberReqRequest) target;
        /* 이메일 필드 값이 비어있거나 공백으로 채워져 있으면 거부 */
        if(regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()
            errors.rejectValue("email", "required");

        /* 가입 페이지에 있는 필드의 name들을 assign 해야함 */
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required");
        if(regReq.hasPassword()){
            /* 비밀번호가 5자리보다 작으면 */
            if(regReq.getPassword().length() < 5)
                errors.rejectValue("password", "shortPassword");
            /* 비밀번호와 비밀번호 재입력 필드가 같지 않으면 */
            else if(!regReq.isSamePasswordConfirmPassword())
                errors.rejectValue("confirmPassword", "notSame");
        }
        Address address = regReq.getAddress();
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
    }
}



