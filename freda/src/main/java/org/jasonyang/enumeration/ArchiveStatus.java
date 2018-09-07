package org.jasonyang.enumeration;

/**
 * 文档状态
 *
 * @author jason
 */
public enum ArchiveStatus {
    /**
     * 全部文章
     */
    ALL(0),
    /**
     * 草稿
     */
    DRAFT(1),
    /**
     * 已发布文章
     */
    PUBLISHED(2);

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    ArchiveStatus(int value) {
        this.value = value;
    }
}
