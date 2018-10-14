package org.silkdog.maven.simpleboard.board.vo;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.type.Alias;

import java.sql.Date;
import java.sql.Timestamp;

@Alias("sbMemberVO")
public class SBMemberVO {
    private int id;
    private String username;
    private String password;
    private String passwordConfirm;
    private String nickname;
    private String realname;
    private int gender;
    private String phone;
    private String introduction;
    private int level;
    private int token;
    private int isProhibited;
    private int prohibitedDate;
    private Date prohibitedStartdate;
    private Date prohibitedEnddate;
    private int isOauth;
    private int isMailingList;
    private int oauthNo;
    private Timestamp regdate;
    private String regip;
    private Timestamp lastLoginDate;
    private String lastLoginIp;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = sha512Encrypt(password);
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = sha512Encrypt(passwordConfirm);
    }

    public boolean hasPassword() {
        return password != null && password.trim().length() > 0;
    }

    /** 중복 코드 경고를 해제 */
    @SuppressWarnings("all")
    public boolean isPasswordSame(String password, String passwordConfirm){
        if(password.equals("") || passwordConfirm.equals("")){
            return false;
        }else if(!password.equals(passwordConfirm) || !passwordConfirm.equals(password)){
            return false;
        }else if(password.equals(passwordConfirm)){
            return true;
        }else{
            /** Something weird happened */
            return false;
        }
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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }

    public int getIsProhibited() {
        return isProhibited;
    }

    public void setIsProhibited(int isProhibited) {
        this.isProhibited = isProhibited;
    }

    public int getProhibitedDate() {
        return prohibitedDate;
    }

    public void setProhibitedDate(int prohibitedDate) {
        this.prohibitedDate = prohibitedDate;
    }

    public Date getProhibitedStartdate() {
        return prohibitedStartdate;
    }

    public void setProhibitedStartdate(Date prohibitedStartdate) {
        this.prohibitedStartdate = prohibitedStartdate;
    }

    public Date getProhibitedEnddate() {
        return prohibitedEnddate;
    }

    public void setProhibitedEnddate(Date prohibitedEnddate) {
        this.prohibitedEnddate = prohibitedEnddate;
    }

    public int getIsOauth() {
        return isOauth;
    }

    public void setIsOauth(int isOauth) {
        this.isOauth = isOauth;
    }

    public int getIsMailingList() {
        return isMailingList;
    }

    public void setIsMailingList(int isMailingList) {
        this.isMailingList = isMailingList;
    }

    public int getOauthNo() {
        return oauthNo;
    }

    public void setOauthNo(int oauthNo) {
        this.oauthNo = oauthNo;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    public String getRegip() {
        return regip;
    }

    public void setRegip(String regip) {
        this.regip = regip;
    }

    public Timestamp getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Timestamp lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }


    public String sha512Encrypt(String password){
        return DigestUtils.sha512Hex(password);
    }

}
