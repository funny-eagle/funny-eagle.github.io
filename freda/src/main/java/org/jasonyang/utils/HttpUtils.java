package org.jasonyang.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author jason
 * @date 18/5/8.
 */
public class HttpUtils {
    /**
     *
     * @param urlStr "http://localhost:8001/imagekeeper/auth"
     * @param content 传参数格式：param=value
     */
    public static String readResultFromPost(String urlStr, String content){
        HttpURLConnection connection;
        URL url;
        InputStreamReader inputStreamReader;
        BufferedReader bufferedReader;
        StringBuffer result;
        try{
            url = new URL(urlStr);

            connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestMethod("POST");
            connection.setUseCaches(false);
            connection.connect();

            DataOutputStream out = new DataOutputStream(connection.getOutputStream());
            // String content = "authCode=imagekeeper";
            out.writeBytes(content);
            out.flush();
            out.close();

            inputStreamReader = new InputStreamReader(connection.getInputStream());
            bufferedReader = new BufferedReader(inputStreamReader);
            String line;
            result = new StringBuffer();
            while((line = bufferedReader.readLine()) != null){
                result.append(line);
            }
            bufferedReader.close();
            connection.disconnect();
            return result.toString();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return null;
    }


    public static void main(String[] args) {
        String result = HttpUtils.readResultFromPost("http://localhost:8001/imagekeeper/auth", "authCode=imagekeeper");
        System.out.println("response: "+result);
    }
}
