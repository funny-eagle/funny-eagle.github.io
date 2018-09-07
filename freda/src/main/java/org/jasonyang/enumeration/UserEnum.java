package org.jasonyang.enumeration;

/**
 * 用户枚举
 *
 * @author jason
 * @date 18/2/4.
 */
public enum UserEnum {
    // session中的用户
    USER("user");

    private String property;

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    UserEnum(String property) {
        this.property = property;
    }
}
