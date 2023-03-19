---
title: 开启ssh代理服务
date: "2018-08-09 03:03:05.403+01"
---

使用ssh开始代理服务

```shell
ssh -qTfnN -D 7070 xxx@xxx.com

-q :- be very quite, we are acting only as a tunnel. 使用安静模式
-T :- Do not allocate a pseudo tty, we are only acting a tunnel.不要分配tty
-f :- move the ssh process to background, as we don’t want to interact with this ssh session directly. 后台运行
-N :- Do not execute remote command.不执行远程命令
-n :- redirect standard input to /dev/null.从定向输出到/dev/null
```
