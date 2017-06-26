<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2017/4/3
  Time: 下午11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!-- Header -->
<header id="header">
    <div class="inner">

        <!-- Logo -->
        <a href="<%=basePath%>" class="logo">
            <span class="symbol"><img src="<%=basePath%>/imgs/monkey.jpg" alt="" /></span><span class="title">Jason Yang's Blog</span>
        </a>

        <!-- Nav -->
        <nav>
            <ul>
                <li><a href="#menu">Menu</a></li>
            </ul>
        </nav>

    </div>
</header>
