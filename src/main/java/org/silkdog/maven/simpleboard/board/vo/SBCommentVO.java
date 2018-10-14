package org.silkdog.maven.simpleboard.board.vo;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("sbCommentVO")
public class SBCommentVO {
    private int no;
    private String id;
    private String pw;
    private String pwConfirm;
    private int visible;
    private int boardId;
    private int depth;
    private String detail;
    private int voteUp;
    private int voteDown;
    private int abuse;
    private Date writedate;
    private Date lastEditedDate;
    private String writeip;
    private String lastEditedIp;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getPwConfirm() {
        return pwConfirm;
    }

    public void setPwConfirm(String pwConfirm) {
        this.pwConfirm = pwConfirm;
    }

    public boolean isPasswordSame(String pw, String pwConfirm){
        if(pw.equals("") || pwConfirm.equals("")){
            return false;
        }else if(!pw.equals(pwConfirm) || !pwConfirm.equals(pw)){
            return false;
        }else if(pw.equals(pwConfirm)){
            return true;
        }else{
            /** Something weird happened */
            return false;
        }
    }

    public int getVisible() {
        return visible;
    }

    public void setVisible(int visible) {
        this.visible = visible;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getVoteUp() {
        return voteUp;
    }

    public void setVoteUp(int voteUp) {
        this.voteUp = voteUp;
    }

    public int getVoteDown() {
        return voteDown;
    }

    public void setVoteDown(int voteDown) {
        this.voteDown = voteDown;
    }

    public int getAbuse() {
        return abuse;
    }

    public void setAbuse(int abuse) {
        this.abuse = abuse;
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
