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
	<form class="bs-example bs-example-form" role="form" method="post">
		<div class="row" style="text-align:center;">
			<div class="col-lg-2">
				<p>NOCODER控制台</p>
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

</body>
</html>