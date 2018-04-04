<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/7
  Time: 上午12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <jsp:include page="../blog/commons/head.jsp"/>
    <title>Jason Yang's Blog Console</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="<%=basePath%>/console"><span class="symbol fa fa-code"></span><span class="title">Jason Yang's Blog Console</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=basePath%>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=basePath%>/about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Post Content Column -->
            <div class="col-lg-12">
                <!-- 文档列表区域-->
                <div id="article_section">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <td><input type="checkbox" class="form-check"/></td>
                                <td>ID</td>
                                <td>标题</td>
                                <td>作者</td>
                                <td>创建日期</td>
                                <td>更新日期</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="archive" items="${archiveList}">
                                <tr>
                                    <td><input type="checkbox" class="form-check"/></td>
                                    <td>${archive.id}</td>
                                    <td>${archive.title}</td>
                                    <td>${archive.author}</td>
                                    <td><fmt:formatDate value="${archive.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td><fmt:formatDate value="${archive.updateTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    <td>编辑</td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <!-- 分页栏 -->
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="disabled"><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
                <!-- loading -->
                <div id="div_load" style="text-align: center;padding-bottom:1em;"></div>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    <jsp:include page="../blog/commons/foot.jsp"/>
    <script></script>
</body>
</html>
