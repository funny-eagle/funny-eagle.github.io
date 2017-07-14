package org.nocoder.enumeration;

/**
 * 文档状态
 * Created by jason on 2017/7/14.
 */
public enum ArchiveStatus {
    ALL(0), DRAFT(1), PUBLISHED(2);

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    ArchiveStatus(int value){
        this.value = value;
    }
}
