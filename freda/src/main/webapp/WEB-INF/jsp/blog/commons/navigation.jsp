<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/3
  Time: 下午8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<%=basePath%>"><span class="symbol fa fa-code" style="margin-right: 0.5em;"></span><span class="title">Jason Yang's Blog</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=basePath%>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=basePath%>/about">About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
