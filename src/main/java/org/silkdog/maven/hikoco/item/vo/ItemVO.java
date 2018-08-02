package org.silkdog.maven.hikoco.item.vo;

import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;
import java.util.Date;

@Alias("ItemVO")
public class ItemVO {
    private int item_id;
    private String item_title;
    private int item_price;
    private int item_amount;
    private String item_manu;
    private String item_vendor;
    private String item_summary;
    private String item_pic;
    private String item_detail;
    private String item_detail2;
    private String item_detail3;
    private Date item_upload_date;
    private Timestamp item_last_edited_date;

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_title() {
        return item_title;
    }

    public void setItem_title(String item_title) {
        this.item_title = item_title;
    }

    public int getItem_price() {
        return item_price;
    }

    public void setItem_price(int item_price) {
        this.item_price = item_price;
    }

    public int getItem_amount() {
        return item_amount;
    }

    public void setItem_amount(int item_amount) {
        this.item_amount = item_amount;
    }

    public String getItem_manu() {
        return item_manu;
    }

    public void setItem_manu(String item_manu) {
        this.item_manu = item_manu;
    }

    public String getItem_vendor() {
        return item_vendor;
    }

    public void setItem_vendor(String item_vendor) {
        this.item_vendor = item_vendor;
    }

    public String getItem_summary() {
        return item_summary;
    }

    public void setItem_summary(String item_summary) {
        this.item_summary = item_summary;
    }

    public String getItem_pic() {
        return item_pic;
    }

    public void setItem_pic(String item_pic) {
        this.item_pic = item_pic;
    }

    public String getItem_detail() {
        return item_detail;
    }

    public void setItem_detail(String item_detail) {
        this.item_detail = item_detail;
    }

    public String getItem_detail2() {
        return item_detail2;
    }

    public void setItem_detail2(String item_detail2) {
        this.item_detail2 = item_detail2;
    }

    public String getItem_detail3() {
        return item_detail3;
    }

    public void setItem_detail3(String item_detail3) {
        this.item_detail3 = item_detail3;
    }

    public Date getItem_upload_date() {
        return item_upload_date;
    }

    public void setItem_upload_date(Date item_upload_date) {
        this.item_upload_date = item_upload_date;
    }

    public Timestamp getItem_last_edited_date() {
        return item_last_edited_date;
    }

    public void setItem_last_edited_date(Timestamp item_last_edited_date) {
        this.item_last_edited_date = item_last_edited_date;
    }
}
