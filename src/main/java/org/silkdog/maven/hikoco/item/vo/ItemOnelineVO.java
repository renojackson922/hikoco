package org.silkdog.maven.hikoco.item.vo;

import java.util.Date;

public class ItemOnelineVO {
    private int id;
    private int memId;
    private String nickname;
    private int itemId;
    private int score;
    private String title;
    private String detail;
    private Date writedate;
    private Date lastEditedDate;
    private String writeIp;

    public ItemOnelineVO(int memId, int itemId, int score, String title, String detail) {
        this.memId = memId;
        this.itemId = itemId;
        this.score = score;
        this.title = title;
        this.detail = detail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemId() {
        return memId;
    }

    public void setMemId(int memId) {
        this.memId = memId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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

    public String getWriteIp() {
        return writeIp;
    }

    public void setWriteIp(String writeIp) {
        this.writeIp = writeIp;
    }
}
