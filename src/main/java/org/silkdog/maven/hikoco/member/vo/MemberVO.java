package org.silkdog.maven.hikoco.member.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import java.sql.Timestamp;

/* applicationContext -> sqlSession -> typeAliases */
@Alias("MemberVO")
public class MemberVO {
    private int id;
//    @Email(message = "이메일 주소 형식에 맞춰주세요.")
//    @NotEmpty(message = "이메일은 필수입니다.")
//    @Size(min = 8, max = 20, message = "비밀번호는 최소 8자, 최대 20자로 입력해주세요.")
    private String userid;
//    @NotEmpty(message = "비밀번호는 필수입니다.")
//    @Pattern(regexp = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})", message = "비밀 번호는 6~20자리로 숫자와 특수 문자가 포함된 영문 대소문자로 입력해 주세요")
    private String password;
    private String passwordConfirm;
//    @NotEmpty(message = "실명은 필수입니다.")
    private String realname;
//    @NotEmpty(message = "닉네임은 필수입니다.")
//    @Size(min = 4, max = 10, message = "닉네임은 최소 4자, 최대 10자로 입력해주세요.")
    private String nickname;
    private String photo;
    private String tier;
//    @NotEmpty(message = "휴대폰 번호는 필수입니다.")
    private String phone;
//    @NotEmpty(message = "생년월일은 필수입니다.")
    private String birthday;
//    @Range(min = 0, max = 1, message = "성별을 선택해주세요.")
    private int sex;
    private String zipcode;
    private String addr1;
    private String addr2;
    private String addr3;
    private String addr4;
    private Timestamp regdate;
    private Timestamp lastlogin_datetime;
    private String lastlogin_ip;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public boolean isSamePasswordConfirmPassword() {
        if (password == null || passwordConfirm == null)
            return false;
        return password.equals(passwordConfirm);
    }

    public boolean hasPassword() {
        return password != null && password.trim().length() > 0;
    }


    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTier() {
        return tier;
    }

    public void setTier(String tier) {
        this.tier = tier;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @DateTimeFormat(pattern="yyyyMMdd")
    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getAddr3() {
        return addr3;
    }

    public void setAddr3(String addr3) {
        this.addr3 = addr3;
    }

    public String getAddr4() {
        return addr4;
    }

    public void setAddr4(String addr4) {
        this.addr4 = addr4;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    public Timestamp getLastlogin_datetime() {
        return lastlogin_datetime;
    }

    public void setLastlogin_datetime(Timestamp lastlogin_datetime) {
        this.lastlogin_datetime = lastlogin_datetime;
    }

    public String getLastlogin_ip() {
        return lastlogin_ip;
    }

    public void setLastlogin_ip(String lastlogin_ip) {
        this.lastlogin_ip = lastlogin_ip;
    }

    @Override
    public String toString() {
//        return "MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", confirmPassword=" + confirmPassword + ", allowNoti="
//                + allowNoti + "]";
        return null;
    }
}