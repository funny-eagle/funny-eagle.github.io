<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>NOCODER</title>

<!-- Bootstrap -->
<link href="<%=basePath %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.label{
	cursor:pointer;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<%=basePath %>/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
	
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=basePath %>">NOCODER</a>
		</div>
		<div>
			<p class="navbar-text">Standing on the Shoulder of Giants</p>
		</div>
	</nav>
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-1 column"></div>
				<div class="col-md-7 column">
					<div id="main-content-area">
						<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%-- 						<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script> --%>
<!-- 						Include all compiled plugins (below), or include individual files as needed -->
<%-- 						<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script> --%>
						<ol class="breadcrumb">
						  <li><a href="<%=basePath %>/">首页</a></li>
						  <li class="active">${article.title }</li>
						</ol>
						<h4>
							${article.title } 
							<small><br/>${article.author } - <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${article.createTime }" /></small>
						</h4>
						<div>
							${article.content }
						</div>
					</div>
				</div>
				<div class="col-md-3 column">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">标签</h3>
						</div>
						<div class="panel-body">
							<div class="row clearfix" style="padding: 5px;">
								<div class="col-md-4 column">
									<span class="label label-default">Java</span>
								</div>
								<div class="col-md-4 column">
									<span class="label label-primary">Python</span>
								</div>
								<div class="col-md-4 column">
									<span class="label label-success">Linux</span>
								</div>
							</div>

							<div class="row clearfix" style="padding: 5px;">
								<div class="col-md-4 column">
									<span class="label label-info">Database</span>
								</div>
								<div class="col-md-4 column">
									<span class="label label-warning">警告标签</span>
								</div>
								<div class="col-md-4 column">
									<span class="label label-danger">危险标签</span>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">最近更新</h3>
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
							<h3 class="panel-title">友情链接</h3>
						</div>
						<div class="panel-body">
							<a href="http://davepu.info">Dave Pu Blog</a>
						</div>
					</div>
				</div>
				<div class="col-md-1 column"></div>
			</div>
		</div>
		<div style="text-align: center;" id="page-area">
			<ul class="pagination">
				<li><a href="<%=basePath%>/index.html?page=${(page==1)?page: page-1}">&laquo; Prev</a></li>
				<c:forEach var="i" begin="1" end="${totalPages }">
				  	<li><a href="<%=basePath%>/index.html?page=${i}">${i }</a></li>
				</c:forEach>
				<li><a href="<%=basePath%>/index.html?page=${page == totalPages ? page : page+1}">Next &raquo;</a></li>
			</ul>
		</div>
	</div>
	
	<footer style="text-align: center;">
		<script type="text/javascript">
			var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
			document.write(unescape("%3Cspan id='cnzz_stat_icon_1257391581'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol 
					+ "s4.cnzz.com/z_stat.php%3Fid%3D1257391581%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
		</script>
		© 2016 nocoder.org by Jason Yang
	</footer>
	<script type="text/javascript">
		function viewArticle(id){
			$.ajax({
				url: "<%=basePath%>/viewArticle.html",
				data:{"id":id},
				success:function(result){
					$("#main-content-area").html(result);
					$("#page-area").hide();
				}
			});
		};
	</script>

</body>
</html>