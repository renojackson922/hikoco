package org.silkdog.maven.hikoco.category.dto;

public class CategoryDTO {
    private int hic_id;
    private String hic_val;
    private String hic_parent;
    private int hic_order;
    private int hic_indent;

    public int getHic_id() {
        return hic_id;
    }

    public void setHic_id(int hic_id) {
        this.hic_id = hic_id;
    }

    public String getHic_val() {
        return hic_val;
    }

    public void setHic_val(String hic_val) {
        this.hic_val = hic_val;
    }

    public String getHic_parent() {
        return hic_parent;
    }

    public void setHic_parent(String hic_parent) {
        this.hic_parent = hic_parent;
    }

    public int getHic_order() {
        return hic_order;
    }

    public void setHic_order(int hic_order) {
        this.hic_order = hic_order;
    }

    public int getHic_indent() {
        return hic_indent;
    }

    public void setHic_indent(int hic_indent) {
        this.hic_indent = hic_indent;
    }
}
