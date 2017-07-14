package org.nocoder.enumeration;

/**
 * 分页信息
 * Created by jason on 2017/7/14.
 */
public enum PageEnum {
    PAGE_SIZE(9);

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    PageEnum(int value){
        this.value = value;
    }
}
