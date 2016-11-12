<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/head.jsp"></jsp:include>
<body>
<!-- 
	<form class="bs-example bs-example-form" method="post">
		<div class="row"  style="margin:0 auto;">
			<div class="col-lg-2">
				<p>Nocoder.Org后台管理系统</p>
				<div class="input-group input-group-sm">
					<span class="input-group-addon">用户名</span> 
					<input type="text" name="username" class="form-control">
				</div>
				<br/>
				<div class="input-group input-group-sm">
					<span class="input-group-addon">密　码</span> 
					<input type="password" name="password" class="form-control">
				</div>
				<br/>
				<button type="submit" class="btn btn-primary">登 录</button>
				<a class="btn btn-success" href="<%=basePath %>">首 页</a>
			</div>
		</div>
	</form>
 -->
<div class="container" style="width:40%;">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center text-info">
				Freda后台维护系统
			</h3>
			<br><br>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath %>/login">
				<div class="form-group">
					 <label for="username" class="col-sm-2 control-label">Account</label>
					<div class="col-sm-10">
						<input type="text" name="username" class="form-control" id="username" />
					</div>
				</div>
				<div class="form-group">
					 <label for="password" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" name="password" class="form-control" id="password" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>