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
<title>控制台</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<img alt="" src="<%=basePath%>/imgs/nocoder-logo.png" class='img-responsive' style="border:1em;border-radius:3em;height:3em;width: 3em;float: left;margin-top: 4px;"/>
			<a class="navbar-brand" href="<%=basePath %>/admin" style="float:left;">控制台</a>
			<a target="_blank" class="navbar-brand" href="<%=basePath %>" style="float:left;">Blog</a>
		</div>
	</nav>
	<jsp:include page="articles.jsp"></jsp:include>
</body>
</html>