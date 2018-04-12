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
<div class="col-md-4" style="padding-top:2em;">
    <!-- 最新文章 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                Recently
            </h3>
        </div>
        <div class="panel-body" id="recentlyArchiveList">
            <c:forEach var="archive" items="${applicationScope.recentlyArchiveList}">
                <a href="<%=basePath%>/archive/${archive.id}">${archive.title}</a><br/>
            </c:forEach>
        </div>
    </div>

</div>