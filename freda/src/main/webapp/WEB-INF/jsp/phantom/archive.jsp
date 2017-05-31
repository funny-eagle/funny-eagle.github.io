<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE HTML>
<!--
Phantom by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>Jason Yang's Blog</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="icon" href="<%=basePath%>/imgs/command.ico">
	<!--[if lte IE 8]><script src="<%=basePath%>/phantom/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie8.css" /><![endif]-->
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

	<!-- Header -->
	<jsp:include page="header.jsp"/>

	<!-- Menu -->
	<jsp:include page="menu.jsp"/>

	<!-- Main -->
	<div id="main">
		<div class="inner">
			<h1>${archive.title}</h1>
			<%--<span class="image main"><img src="<%=basePath%>/phantom/images/pic13.jpg" alt="" /></span>--%>
			<p>
				${archive.htmlContent}

			</p>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"/>

</div>

<!-- Scripts -->
<script src="<%=basePath%>/phantom/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/phantom/assets/js/skel.min.js"></script>
<script src="<%=basePath%>/phantom/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="<%=basePath%>/phantom/assets/js/ie/respond.min.js"></script><![endif]-->
<script src="<%=basePath%>/phantom/assets/js/main.js"></script>

</body>
</html>

