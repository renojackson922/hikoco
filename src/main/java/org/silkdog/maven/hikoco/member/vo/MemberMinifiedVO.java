package org.silkdog.maven.hikoco.member.vo;

public class MemberMinifiedVO {
    private int id;
    private String userid;
    private String password;
    private String realname;
    private String nickname;

    public MemberMinifiedVO(int id, String userid, String password, String realname, String nickname) {
        this.id = id;
        this.userid = userid;
        this.password = password;
        this.realname = realname;
        this.nickname = nickname;
    }

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

    public boolean matchPassword(String inputPassword) {
        return password.equals(inputPassword);
    }

}
