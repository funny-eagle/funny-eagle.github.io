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
	<title>Jason Yang's Blog - ${archive.title}</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="icon" href="<%=basePath%>/imgs/command.ico">
	<!--[if lte IE 8]><script src="<%=basePath%>/phantom/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie8.css" /><![endif]-->
	<style type="text/css">
		#span_author{
			color:#6496e7;
			border:1px solid;
			border-radius: 5px;
			margin-right: 3px;
			padding:1px;
			letter-spacing:1px;
		}
	</style>
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
			<div style="color: #969696;font-size:14px;padding-top: 1em;">
				<a href="#"><span id="span_author">&nbsp;${archive.tag}&nbsp;</span></a>&nbsp;${archive.author}&nbsp;|&nbsp;
				<fmt:formatDate value="${archive.createTime}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate>
			</div>
			<div id="archive_content" style="margin-top: 1em;">
				${archive.htmlContent}
			</div>

			<!-- JiaThis Button BEGIN -->
			<div class="jiathis_style_32x32" style="margin-top: 1em; margin-bottom:1em;">
				<a class="jiathis_button_weixin"></a>
				<a class="jiathis_button_tsina"></a>
				<a class="jiathis_button_qzone"></a>
				<a class="jiathis_button_tqq"></a>
				<a href="http://www.jiathis.com/share?uid=2115022" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
				<a class="jiathis_counter_style"></a>
			</div>
			<script type="text/javascript">
				var jiathis_config = {data_track_clickback:'true'};
			</script>
			<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=2115022" charset="utf-8"></script>
			<!-- JiaThis Button END -->
			<div style="padding-bottom:3em;"></div>


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

