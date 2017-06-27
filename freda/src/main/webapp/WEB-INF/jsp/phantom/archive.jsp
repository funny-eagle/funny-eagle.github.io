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
			<div style="color: #969696;font-size:13px;">
				<span style="color:#6496e7;border:1px solid;border-radius: 5px;margin-right: 3px;padding:2px;letter-spacing:1px;">作者</span>
				<a href="#">${archive.author}</a><br>
				<fmt:formatDate value="${archive.createTime}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate>
				<span style="margin-left:0.5em;">字数 817</span>
				<span style="margin-left:0.5em;">阅读 7</span>
				<span style="margin-left:0.5em;">评论 0</span>
				<span style="margin-left:0.5em;">喜欢 0</span>
			</div>
			<p id="archive_content">
				${archive.htmlContent}
			</p>

			<!-- 友言评论 UY BEGIN -->
			<div id="uyan_frame"></div>
			<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2115022"></script>
			<!-- 友言评论 UY END -->
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

