package org.jasonyang.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 序列化工具
 * Created by yangjinlong on 16/9/25.
 *
 * @author jason
 */
public class SerializeUtil {

    /**
     * 对象序列化
     *
     * @param obj
     * @return bytes
     */
    public static byte[] serialize(Object obj) {
        ObjectOutputStream objectOutputStream = null;
        ByteArrayOutputStream byteArrayOutputStream = null;
        byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bytes = null;
        try {
            objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(obj);
            bytes = byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return bytes;
    }

    /**
     * 反序列化对象
     *
     * @param bytes
     * @return object
     */
    public static Object unserialize(byte[] bytes) {
        ObjectInputStream objectInputStream = null;
        ByteArrayInputStream byteArrayInputStream = null;
        Object obj = null;

        byteArrayInputStream = new ByteArrayInputStream(bytes);
        try {
            objectInputStream = new ObjectInputStream(byteArrayInputStream);

            obj = objectInputStream.readObject();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return obj;
    }

    /**
     * 列表对象序列化
     *
     * @param list
     * @return
     */
    public static byte[] serializeList(List<?> list) {
        ObjectOutputStream objectOutputStream = null;
        ByteArrayOutputStream baot = new ByteArrayOutputStream();
        try {
            objectOutputStream = new ObjectOutputStream(baot);
            for (Object obj : list) {
                objectOutputStream.writeObject(obj);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return baot.toByteArray();
    }

    /**
     * 列表对象反序列化
     *
     * @param bytes
     * @return
     */
    public static List<?> unserializeList(byte[] bytes) {
        List<Object> list = new ArrayList<Object>();
        ObjectInputStream objectInputStream = null;
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        try {
            objectInputStream = new ObjectInputStream(bais);
            while (bais.available() > 0) {
                try {
                    list.add(objectInputStream.readObject());
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    /*测试
    public static void main(String[] args){
        List<Article> list = new ArrayList<>();
        for (int i=0 ; i < 10 ; i ++){
            Article a = new Article();
            a.setId("id_" + i);
            a.setTitle("title_" + i);
            list.add(a);
        }

        RedisUtils.setList("articleList", list);
        System.out.println(((Article)RedisUtils.getList("articleList").get(0)).getTitle());
    }
    */

}
