---
title: 在Ubuntu上安装Spring Tool Suite
date: "2019-07-25 17:42:59"
---

Step 1: 下载 Spring Tool Suite for Linux: https://spring.io/tools

Step 2: 解压到`/usr/local/sts/sts-4.3.1.RELEASE/SpringToolSuite4`

Step 3: 创建启动应用图标

```shell
sudo vim /usr/share/applications/STS.desktop
```

Step 4: 编辑 STS.desktop

```shell
[Desktop Entry]
Name=Spring Tool Suite
Comment=SpringSource Tool Suite
Exec=/usr/local/sts/sts-4.3.1.RELEASE/SpringToolSuite4
Icon=/usr/local/sts/sts-4.3.1.RELEASE/icon.xpm
StartupNotify=true
Terminal=false
Type=Application
Categories=Development;IDE;Java;
```

Step 5: 保存后就可以在启动应用程序中找到Spring Tool Suite并启动了
