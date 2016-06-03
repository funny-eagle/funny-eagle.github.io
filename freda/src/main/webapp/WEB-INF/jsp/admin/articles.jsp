<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<jsp:include page="../common/head.jsp"></jsp:include>
<body>
	<table class="table table-responsive">
		<caption>文章列表</caption>
		<thead>
			<tr>
				<th>标题</th>
				<th>作者</th>
				<th>标签</th>
				<th>创建日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articleList }" var="article">
				<tr>
					<td>${article.title }</td>
					<td>${article.author }</td>
					<td>${article.tag }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${article.createTime }" /></td>
					<td width="30px;"><a class="btn"
						href="<%=basePath%>/article/edit.html?id=${article.id}">编辑</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<div style="text-align: center;">
		<ul class="pagination">
			<li><a href="<%=basePath%>/article.html?page=${(page==1)?page: page-1}">上一页</a></li>
			<c:forEach var="i" begin="1" end="${totalPages }">
				<li><a href="<%=basePath%>/article.html?page=${i}">${i }</a></li>
			</c:forEach>
			<li><a href="<%=basePath%>/article.html?page=${page == totalPages ? page : page+1}">下一页</a></li>
		</ul>
	</div>
</body>
</html>