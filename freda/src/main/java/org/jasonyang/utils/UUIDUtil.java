package org.jasonyang.utils;

/**
 * @author jason
 * @date 18/1/7.
 */
public class UUIDUtil {
    public static String getUUID() {
        return java.util.UUID.randomUUID().toString().replace("-", "");
    }

}
