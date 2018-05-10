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
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=basePath%>"><span class="symbol fa fa-code" style="margin-right: 0.5em;"></span><span class="title">NoCoder</span></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="navbar-link" href="<%=basePath%>"><span class="symbol fa fa-home"></span> Home</a></li>
                <li><a class="navbar-link" href="<%=basePath%>/about"><span class="symbol fa fa-user-secret"></span> About</a></li>
            </ul>
        </div>
    </div>
</nav>