---
title: linux下安装jdk
date: "2017-04-08 06:29:29.961+01"
---
下载jdk.tar.gz，创建java目录
```
sudo mkdir /usr/local/java
```
然后将下载到压缩包拷贝到java文件夹中，命令行：

进入jdk源码包所在目录

```
cp jdk-7u45-linux-x64.tar.gz /usr/local/java
```
然后进入java目录，命令行：
```
cd /usr/local/java
```
解压压缩包，命令行：
```
sudo tar -xvf jdk-7u45-linux-x64.tar.gz
```
然后可以把压缩包删除，命令行：
```
sudo rm jdk-7u45-linux-x64.tar.gz
```

3、设置dk环境变量

这里采用全局设置方法，就是修改etc/profile，它是是所有用户的共用的环境变量
```
sudo gedit /etc/profile
```
打开之后在末尾添加
```
export JAVA_HOME=/usr/local/java/1.7.0_45
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```
等号两侧不要加入空格，不然会出现“不是有效的标识符”，因为sour/proce /etc/profile 时不能识别多余到空格，会理解为是路径一部分。

执行
```
source /etc/profile
```
使profile生效

4、检验是否安装成功


在终端
```
java -version
```

检查是否安装成功
成功则显示如下
```
java version "1.7.0_45"
Java(TM) SE Runtime Environment (build 1.7.0_45-b18)
Java HotSpot(TM) 64-Bit Server VM (build 24.45-b08, mixed mode)
```
