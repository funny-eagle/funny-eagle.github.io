package org.nocoder.blog;

import org.apache.commons.codec.digest.DigestUtils;

public class EncryptUtilTest {
    public static void main(String[] args) {
        String password = "123456";
        String encryptPassword = DigestUtils.md5Hex(password);
        System.out.println("password: " + password);
        System.out.println("encryptPassword: " + encryptPassword);
    }
}
