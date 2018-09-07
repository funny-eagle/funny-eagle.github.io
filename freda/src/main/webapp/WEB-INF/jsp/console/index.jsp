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
    <title>NoCoder Console</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/blog/css/blog-post.css" rel="stylesheet">
    <link rel="icon" href="<%=basePath%>/images/command.ico">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=basePath%>/console"><span class="symbol fa fa-code" style="margin-right: 0.5em;"></span><span class="title">Blog Console</span></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="navbar-link" href="<%=basePath%>"><span class="symbol fa fa-home"></span> Home</a></li>
                <li><a class="navbar-link" href="<%=basePath%>/about"><span class="symbol fa fa-user-secret"></span> About</a></li>
            </ul>
        </div>
    </div>
</nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Post Content Column -->
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a type="button" class="btn btn-default btn-primary" href="<%=basePath%>/console/archive/new"><span class="symbol fa fa-plus"/> New Archive</a>
                        <hr/>
                        <div id="article_section">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="display:none;"><input type="checkbox" class="form-check"/></td>
                                    <td style="display:none;">ID</td>
                                    <td>Title</td>
                                    <td>Author</td>
                                    <td>Create Time</td>
                                    <td>Update Time</td>
                                    <td>Status</td>
                                    <td>Operation</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="archive" items="${archiveList}">
                                    <tr>
                                        <td style="display:none;"><input type="checkbox" class="form-check"/></td>
                                        <td style="display: none">${archive.id}</td>
                                        <td>${archive.title}</td>
                                        <td>${archive.author}</td>
                                        <td><fmt:formatDate value="${archive.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                        <td><fmt:formatDate value="${archive.updateTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                        <td>${archive.state == 2 ? 'published' : 'draft'}</td>
                                        <td><a href="<%=basePath%>/archive/edit/${archive.id}">Edit</a>  <a href="<%=basePath%>/archive/unpublish/${archive.id}">Unpublish</a></td>
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
                    </div>
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
