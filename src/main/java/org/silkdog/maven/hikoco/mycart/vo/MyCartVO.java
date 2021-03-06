package org.silkdog.maven.hikoco.mycart.vo;

import java.sql.Timestamp;

public class MyCartVO {
    private int cart_id;
    private int mem_id;
    private int item_id;
    private String item_title;
    private int item_price;
    private int cart_count;
    private Timestamp cart_datetime;
    private String cart_ip;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

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

    public int getCart_count() {
        return cart_count;
    }

    public void setCart_count(int cart_count) {
        this.cart_count = cart_count;
    }

    public Timestamp getCart_datetime() {
        return cart_datetime;
    }

    public void setCart_datetime(Timestamp cart_datetime) {
        this.cart_datetime = cart_datetime;
    }

    public String getCart_ip() {
        return cart_ip;
    }

    public void setCart_ip(String cart_ip) {
        this.cart_ip = cart_ip;
    }

    public MyCartVO(int mem_id, int item_id, int cart_count, Timestamp cart_datetime, String cart_ip){
        this.mem_id = mem_id;
        this.item_id = item_id;
        this.cart_count = cart_count;
        this.cart_datetime = cart_datetime;
        this.cart_ip = cart_ip;
    }

    public MyCartVO(int cart_id, int mem_id, int item_id, int cart_count, Timestamp cart_datetime, String cart_ip){
        this.cart_id = cart_id;
        this.mem_id = mem_id;
        this.item_id = item_id;
        this.cart_count = cart_count;
        this.cart_datetime = cart_datetime;
        this.cart_ip = cart_ip;
    }

    public MyCartVO(int cart_id, int mem_id, int item_id, String item_title,int cart_count, Timestamp cart_datetime, String cart_ip){
        this.cart_id = cart_id;
        this.mem_id = mem_id;
        this.item_id = item_id;
        this.item_title = item_title;
        this.cart_count = cart_count;
        this.cart_datetime = cart_datetime;
        this.cart_ip = cart_ip;
    }
}
