package org.silkdog.maven.hikoco.member.authenticator;

public class Auth {
    private int id;
    private String userid;
    private String nickname;

    public Auth(int id, String userid, String nickname){
        this.id = id;
        this.userid = userid;
        this.nickname = nickname;
    }

    public int getId() {
        return id;
    }

    public String getUserid() {
        return userid;
    }

    public String getNickname(){
        return nickname;
    }
}
