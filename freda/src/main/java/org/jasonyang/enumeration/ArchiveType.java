package org.jasonyang.enumeration;

/**
 * 文档类型
 * Created by jason on 2017/7/14.
 *
 * @author jason
 */
public enum ArchiveType {
    /**
     * 技术类
     */
    TECHNOLOGY(1),
    /**
     * 其他类
     */
    OTHER(2);
    private int value;

    public void setValue(int val) {
        this.value = val;
    }

    public int getValue() {
        return this.value;
    }

    ArchiveType(int value) {
        this.value = value;
    }
}
