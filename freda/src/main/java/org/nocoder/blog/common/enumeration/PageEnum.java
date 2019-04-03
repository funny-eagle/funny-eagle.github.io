package org.nocoder.blog.common.enumeration;

/**
 * 分页信息
 * Created by jason on 2017/7/14.
 *
 * @author jason
 */
public enum PageEnum {
    /**
     * 每页显示数据的记录数
     */
    SIZE_PER_PAGE(10);

    private int value;

    public int val(){
        return this.value;
    }

    PageEnum(int value) {
        this.value = value;
    }
}
