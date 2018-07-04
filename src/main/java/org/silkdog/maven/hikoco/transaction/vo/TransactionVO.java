package org.silkdog.maven.hikoco.transaction.vo;

public class TransactionVO {
    private int no;
    private String seller;
    private String purchaser_rn;
    private String purchaser_id;
    private String purdate;
    private int itemno;
    private String itemname;
    private int itemcost_original;
    private int itemcost_actual;
    private String is_discount;
    private String extrainfo;
    private String ship_status;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public String getPurchaser_rn() {
        return purchaser_rn;
    }

    public void setPurchaser_rn(String purchaser_rn) {
        this.purchaser_rn = purchaser_rn;
    }

    public String getPurchaser_id() {
        return purchaser_id;
    }

    public void setPurchaser_id(String purchaser_id) {
        this.purchaser_id = purchaser_id;
    }

    public String getPurdate() {
        return purdate;
    }

    public void setPurdate(String purdate) {
        this.purdate = purdate;
    }

    public int getItemno() {
        return itemno;
    }

    public void setItemno(int itemno) {
        this.itemno = itemno;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public int getItemcost_original() {
        return itemcost_original;
    }

    public void setItemcost_original(int itemcost_original) {
        this.itemcost_original = itemcost_original;
    }

    public int getItemcost_actual() {
        return itemcost_actual;
    }

    public void setItemcost_actual(int itemcost_actual) {
        this.itemcost_actual = itemcost_actual;
    }

    public String getIs_discount() {
        return is_discount;
    }

    public void setIs_discount(String is_discount) {
        this.is_discount = is_discount;
    }

    public String getExtrainfo() {
        return extrainfo;
    }

    public void setExtrainfo(String extrainfo) {
        this.extrainfo = extrainfo;
    }

    public String getShip_status() {
        return ship_status;
    }

    public void setShip_status(String ship_status) {
        this.ship_status = ship_status;
    }
}
