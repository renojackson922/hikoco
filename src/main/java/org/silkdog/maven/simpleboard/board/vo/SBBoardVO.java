package org.silkdog.maven.simpleboard.board.vo;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("sbBoardVO")
public class SBBoardVO {
    private int id;
    private int memid;
    private String username;
    private String password;
    private String passwordConfirm;
    private int category;
    private String title;
    private String detail;
    private int hit;
    private Date writedate;
    private Date lastEditedDate;
    private String writeip;
    private String lastEditedIp;

//    public BoardVO(String username, String password, int category, String title, String detail){
//        this.username = username;
//        this.password = password;
//        this.category = category;
//        this.title = title;
//        this.detail = detail;
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemid() {
        return memid;
    }

    public void setMemid(int memid) {
        this.memid = memid;
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
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    /** 비밀번호 1차 검증 */
    public boolean isSamePasswordConfirmPassword() {
        if (password == null || passwordConfirm == null)
            return false;
        return password.equals(passwordConfirm);
    }

    /** 비밀번호 입력여부 확인 */
    public boolean hasPassword() {
        return password != null && password.trim().length() > 0;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

//    public Blob getDetail() {
//        return detail;
//    }
//
//    public void setDetail(Blob detail) {
//        this.detail = detail;
//    }


    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public Date getLastEditedDate() {
        return lastEditedDate;
    }

    public void setLastEditedDate(Date lastEditedDate) {
        this.lastEditedDate = lastEditedDate;
    }

    public String getWriteip() {
        return writeip;
    }

    public void setWriteip(String writeip) {
        this.writeip = writeip;
    }

    public String getLastEditedIp() {
        return lastEditedIp;
    }

    public void setLastEditedIp(String lastEditedIp) {
        this.lastEditedIp = lastEditedIp;
    }
}
