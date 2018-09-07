package org.nocoder.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;

/**
 * EncryptUtil
 * Created by jason on 2017/7/18.
 *
 * @author jason
 */
public class EncryptUtil {

    /**
     * 加密
     *
     * @param value
     * @return
     */
    public static String encode(String value) {
        if (StringUtils.isNotBlank(value)) {
            Base64 base64 = new Base64();
            return new String(base64.encode(base64.encode(value.getBytes())));
        }
        return null;
    }

    /**
     * 解密
     *
     * @param value
     * @return
     */
    public static String decode(String value) {
        if (StringUtils.isNotBlank(value)) {
            Base64 base64 = new Base64();
            return new String(base64.decode(base64.decode(value.getBytes())));
        }
        return null;
    }

    public static void main(String[] args) {
        // username=Y0c5emRHZHlaWE09
        // password=Wm5KbFpHRndadz09
        System.out.println(EncryptUtil.encode("nocoder"));
        System.out.println(EncryptUtil.decode("Y0c5emRHZHlaWE09"));
        System.out.println(EncryptUtil.decode("Wm5KbFpHRndadz09"));
    }
}
