<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/3
  Time: 下午8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<div class="col-md-4">
    <!-- 搜索 -->
    <div class="card my-4">
        <h5 class="card-header">Search</h5>
        <div class="card-body">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
            </div>
        </div>
    </div>

    <!-- 最新文章 -->
    <div class="card my-4">
        <h5 class="card-header">Recently</h5>
        <div class="card-body">
            <div class="" id="recentlyArchiveList">
                <c:forEach var="archive" items="${applicationScope.recentlyArchiveList}">
                    <a href="<%=basePath%>/archive/${archive.id}">${archive.title}</a><br/>
                </c:forEach>
            </div>
        </div>
    </div>

</div>