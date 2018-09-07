package org.jasonyang.enumeration;

/**
 * 分页信息
 * Created by jason on 2017/7/14.
 *
 * @author jason
 */
public enum PageSizeEnum {
    /**
     * 每页显示数据的记录数
     */
    PAGE_SIZE(10);

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    PageSizeEnum(int value) {
        this.value = value;
    }
}
