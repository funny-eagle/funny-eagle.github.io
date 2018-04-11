<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/7
  Time: 上午12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <jsp:include page="../blog/commons/head.jsp"/>
    <title>Console</title>
    <link href="<%=basePath%>/vendor/simplemde/simplemde.min.css" rel="stylesheet">
    <script src="<%=basePath%>/vendor/simplemde/simplemde.min.js"></script>
    <style>

        .editor-toolbar.fullscreen{
            z-index:1031
        }
        .CodeMirror-fullscreen{
            z-index:1031
        }

        .editor-preview-side{
            z-index:1031
        }
    </style>
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
            <!-- 文档区域-->
            <div id="article_section">
                文档编辑页面
                <textarea id="simplemde"></textarea>
            </div>
            <!-- loading -->
            <div id="div_load" style="text-align: center;padding-bottom:1em;"></div>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="../blog/commons/foot.jsp"/>
<script>
    var simplemde = new SimpleMDE({
        element: $("#simplemde")[0]
    });
</script>
</body>
</html>
