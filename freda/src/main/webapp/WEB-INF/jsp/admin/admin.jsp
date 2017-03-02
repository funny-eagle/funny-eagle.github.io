<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Freda博客管理系统</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<img alt="" src="<%=basePath%>/imgs/nocoder-logo.png" class='img-responsive' style="witdh:40px; height:40px; float:left; padding-left:10px;padding-top:8px;"/>
			<a class="navbar-brand" href="<%=basePath %>/admin" style="float:left;">Freda博客管理系统</a>
			<a target="_blank" class="navbar-brand" href="<%=basePath %>" style="float:left;">Blog</a>
		</div>
	</nav>
	<jsp:include page="articles.jsp"></jsp:include>
</body>
</html>