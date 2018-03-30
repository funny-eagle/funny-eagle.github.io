package org.jasonyang.utils;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

/**
 * 配置信息工具类
 * Created by jason on 2017/8/19.
 *
 * @author jason
 */
public class PropUtils {
    public static String LOCATION;

    public static final String CONFIG = "config.properties";

    static {
        try {
            String temp = URLDecoder.decode(PropUtils.class.getProtectionDomain().getCodeSource().getLocation().getFile(), "UTF-8");
            LOCATION = "/" + temp.substring(1, temp.lastIndexOf('/'));
        } catch (UnsupportedEncodingException e) {
            LOCATION = "";
        }

    }

    /**
     * @param args
     * @throws Exception
     */
    public static Properties getProperties(String filepath) throws Exception {
        Properties prop = new Properties();
        FileInputStream fis = new FileInputStream(LOCATION + "/" + filepath);
        prop.load(fis);
        return prop;
    }

    public static String getConfigValue(String key) {
        try {
            Properties properties = getProperties(CONFIG);
            if (properties.get(key) != null) {
                return properties.get(key).toString();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

    public static void main(String[] args) {
        try {
            String host = getConfigValue("redis_server_host");
            String port = getConfigValue("redis_server_port");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
