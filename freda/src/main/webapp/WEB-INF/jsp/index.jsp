<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>NOCODER.ORG</title>

<!-- Bootstrap -->
<link href="<%=basePath%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.label {
	cursor: pointer;
}

.row {
	margin-left: 0px;
	margin-right: 0px;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<%=basePath%>/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath%>/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top:100px;">

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<%=basePath%>/bootstrap/js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a href="<%=basePath%>"><img alt="" src="<%=basePath%>/imgs/nocoder-logo.png"
				class='img-responsive'
				style="witdh: 40px; height: 40px; float: left; padding-left: 10px; padding-top: 8px;" /></a>
			<a class="navbar-brand" href="<%=basePath%>" style="float: left;"><span>Nocoder.Org</span></a>
		</div>
<!-- 		<div> -->
<!-- 			<p class="navbar-text">  站在巨人的肩膀上</p> -->
<!-- 		</div> -->
		<!-- <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="" data-toggle="dropdown">
               <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
               
            </a>
            
         </li>
      </ul> -->
	</nav>

	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
<!-- 				<div class="col-md-1 column"></div> -->
				<div class="col-md-9 column">
					<div id="main-content-area">

						<c:choose>
							<c:when test="${articleList == null }">
								<ol class="breadcrumb">
									<li><a href="<%=basePath%>/">首页</a></li>
									<li class="active">${article.title }</li>
								</ol>
								<div style="text-align: right">
									<small> 作者:${article.author } - <fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${article.createTime }" />
									</small>
								</div>
								<div>${article.content }</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${articleList }" var="article">
									<a id="titleLink" title="点击标题查看全文"
										href="<%=basePath%>/article.html?id=${article.id}"
										style="font-size: 20px;">${article.title }</a>
									<p>${article.preview }</p>
									<hr />
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				<div class="col-md-3 column">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">最新</h3>
						</div>
						<div class="panel-body">
							<!-- 最新内容 -->
							<a>Java装饰器模式</a>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">热门</h3>
						</div>
						<div class="panel-body">
							<!-- 热门内容 -->
							<a>Java装饰器模式</a>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">关于</h3>
						</div>
						<div class="panel-body">
							<img alt="" src="<%=basePath%>/imgs/monkey.jpg"
								class="img-responsive" />
								<span class="label label-primary" onclick="window.open('https://github.com/no-coder')">GitHub</span>
								<a target="_blank" href="https://github.com/no-coder">https://github.com/no-coder</a><br>
								<span class="label label-success" onclick="window.open('http://weibo.com/227307890')">Weibo</span>
								<a target="_blank" href="http://weibo.com/227307890">http://weibo.com/227307890</a><br />
						</div>
					</div>
				</div>
<!-- 				<div class="col-md-1 column"></div> -->
			</div>
		</div>
		<c:choose>
			<c:when test="${articleList != null }">
				<div style="text-align: center;" id="page-area">
					<ul class="pagination">
						<li><a
							href="<%=basePath%>/index.html?page=${(page==1)? page : page-1}">Prev</a></li>
						<c:forEach var="i" begin="1" end="${totalPages }">
							<li><a href="<%=basePath%>/index.html?page=${i}">${i}</a></li>
						</c:forEach>
						<li><a
							href="<%=basePath%>/index.html?page=${page == totalPages ? page : page+1}">Next</a></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
	</div>

	<footer style="text-align: center;">
		<!--CNZZ数据统计  -->
		<script type="text/javascript">
			var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
			document.write(unescape("%3Cspan id='cnzz_stat_icon_1257391581'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol 
					+ "s4.cnzz.com/z_stat.php%3Fid%3D1257391581%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
		</script>
		Copyright © 2016 nocoder.org
	</footer>
	<script type="text/javascript">
		function viewArticle(id){
			$.ajax({
				url: "<%=basePath%>/viewArticle.html",
				data : {
					"id" : id
				},
				success : function(result) {
					$("#main-content-area").html(result);
					$("#page-area").hide();
				}
			});
		};
	</script>

</body>
</html>
