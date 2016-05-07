<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>NOCODER.ORG</title>

<!-- Bootstrap -->
<link href="<%=basePath %>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<%=basePath %>/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>