package org.silkdog.maven.simpleboard.board.vo;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("sbCategoryVO")
public class SBCategoryVO {
    private int no;
    private String cname;
    private String caka;
    private int boardCnt;
    private int visible;
    private int depth;
    private int parent;
    private Date createdDate;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCaka() {
        return caka;
    }

    public void setCaka(String caka) {
        this.caka = caka;
    }

    public int getBoardCnt() {
        return boardCnt;
    }

    public void setBoardCnt(int boardCnt) {
        this.boardCnt = boardCnt;
    }

    public int getVisible() {
        return visible;
    }

    public void setVisible(int visible) {
        this.visible = visible;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
