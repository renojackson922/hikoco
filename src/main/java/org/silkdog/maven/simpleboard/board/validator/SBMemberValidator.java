package org.silkdog.maven.simpleboard.board.validator;

import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Service
@Qualifier("SBMemberValidator")
public class SBMemberValidator implements Validator {
    /**
     *  컨트롤러 이외의 클래스에서 @Autowired 로 DAO를 가져오지 못하는 경우(bean 인식 불가, null)
     */
    protected final SBMemberDAO sbMemberDAO;

    @Autowired
    public SBMemberValidator(SBMemberDAO sbMemberDAO){
        this.sbMemberDAO = sbMemberDAO;
    }

    @Override
    public boolean supports(Class<?> clazz){
        return SBMemberVO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors){
        SBMemberVO sbMemberVO = (SBMemberVO) target;
        if(sbMemberVO.getUsername() == null || sbMemberVO.getUsername().trim().isEmpty())
            errors.rejectValue("username", "required");

        /* 이메일 형식 준수 검사 */
        final boolean isUseridQualify = Pattern.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", sbMemberVO.getUsername());
        if(!isUseridQualify) errors.rejectValue("username", "usernameNotQualify");

        /* 이메일 중복 여부 검사 */
        String username = sbMemberVO.getUsername();
        int count = sbMemberDAO.isUsernameExists(username);
        if(count != 0) errors.rejectValue("username", "usernameAlreadyExists");


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "realname", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "required");

        /* 비밀번호 검사 */
        if(sbMemberVO.hasPassword()){
            /**
             *  서순 주의
             *  1) 비밀번호의 길이 검사
             *  2) 비밀번호 일치여부 확인
             *  */
            String pw = sbMemberVO.getPassword();
            String pwConfirm = sbMemberVO.getPasswordConfirm();
            if(sbMemberVO.getPassword().length() < 5)
                errors.rejectValue("password", "shortPassword");
            else if(!sbMemberVO.isPasswordSame(pw, pwConfirm))
                errors.rejectValue("passwordConfirm", "notSame");
        }

        /**
         *  실명 한글 검사
         *  1) 한글 여부 검사ß
         *  2) 길이 검사
         *  */
        final boolean isRealnameKor = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", sbMemberVO.getRealname());
        if(!isRealnameKor) errors.rejectValue("realname", "notKorean");

        /**
         *  닉네임 검사
         *  1) 영문, 한글, 숫자 이외의 문자가 포함되는지 확인
         *  2) 길이 검사
         *  */
        final String nickname = sbMemberVO.getNickname();
        count = sbMemberDAO.isNicknameExists(nickname);
        final boolean nicknamePattern = Pattern.matches("^[a-zA-Zㄱ-ㅎ가-힣0-9]*$", nickname);
        if(!nicknamePattern){
            errors.rejectValue("nickname", "nicknameContainsSpecialChar");
        }else if(count != 0){
            errors.rejectValue("nickname", "nicknameAlreadyExists");
        }

        /**
         * 생년월일 검사
         *
         * */



        /**
         *  휴대폰 번호 검사
         *  1) 휴대폰 번호 형식에 맞는지 확인.
         *  2) 중복된 휴대폰 번호인지 확인.
         *  */

        final String phone = sbMemberVO.getPhone();
        final boolean phonePattern = Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", phone);
        count = sbMemberDAO.isPhoneExists(phone);
        if(!phonePattern){
            errors.rejectValue("phone", "notPhoneNumber");
        }else if(count != 0 ){
            errors.rejectValue("phone", "phoneAlreadyExists");
        }

        /** 성별 검사
         *  select 태그의 값이 0이면 "선택하세요" 이므로, 성별을 선택하지 않은 것
         * */

        if(sbMemberVO.getGender() == 0 || 0 == sbMemberVO.getGender()) {
            errors.rejectValue("gender", "genderNotSelected");
        }

        /** 주소 검사
         *
         * */


        /** Google reCaptcha 검사
         *
         * */
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
