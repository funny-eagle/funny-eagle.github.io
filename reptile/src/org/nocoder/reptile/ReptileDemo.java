package org.nocoder.reptile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 * reptile
 * 一个简单的网页爬虫示例
 * @author yangjinlong
 *
 */
public class ReptileDemo {

	public static void main(String[] args) {
		String urlStr = "http://www.baidu.com";
		// 定义一个字符串用来存储网页内容
		String pageContent = "";
		// 定义一个输入流用来读取网页内容
		BufferedReader br = null;
		try {
			URL url = new URL(urlStr);
			// 初始化URL链接
			URLConnection connection = url.openConnection();
			// 打开连接
			connection.connect();
			// 读取connection中的内容
			br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = null;
			while((line = br.readLine()) != null){
				// 逐行读取，暂存到pageContent
				pageContent += line;
			}
			System.out.println(pageContent);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
