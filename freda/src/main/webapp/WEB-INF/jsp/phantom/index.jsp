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
							<header>
								<h1>Standing on the shoulders of giants</h1>
								<p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam dolore.</p>
							</header>
							<section class="tiles">
								<c:forEach items="${archiveList }" var="archive">
									<article class="style<%=1+new java.util.Random().nextInt(6)%>">
										<span class="image">
											<img src="<%=basePath%>/phantom/images/pic03.jpg" alt="" />
										</span>
										<a href="archive?id=${archive.id}">
											<h2>${archive.title}</h2>
											<div class="content">
												<p>${archive.preview}</p>
											</div>
										</a>
									</article>
								</c:forEach>
							</section>

							<c:choose>
								<c:when test="${totalPages != null }">
									<section style="position:absolute;left:50%;margin-left:-5%; margin-top:3%;">
										<ul class="actions">
											<li><a href="<%=basePath%>/archive_list?page=${(page==1)? page : page-1}" class="button">上一页</a></li>
											<li><a href="<%=basePath%>/archive_list?page=${page == totalPages ? page : page+1}" class="button">下一页</a></li>
										</ul>
									</section>
								</c:when>
							</c:choose>


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