package org.nocoder.enumeration;

/**
 * 文档类型
 * Created by jason on 2017/7/14.
 */
public enum ArchiveType {
    TECHNOLOGY(1), OTHER(2);
    private int value;

    public void setValue(int val){
        this.value = val;
    }
    public int getValue(){
        return this.value;
    }

    ArchiveType(int value){
        this.value = value;
    }
}
