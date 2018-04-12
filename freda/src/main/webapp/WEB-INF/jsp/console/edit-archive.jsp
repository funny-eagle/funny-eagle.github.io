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
    <title>Jason Yang's Blog Console</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/blog/css/blog-post.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/github-markdown/github-markdown.css" rel="stylesheet">
    <link rel="icon" href="<%=basePath%>/images/command.ico">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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
            <form method="post">
                主键：<input id="id" name="id" value="${archive.id}" disabled="disabled"/>
                标题：<input id="title" name="title" value="${archive.title}"/>
                作者：<input id="author" name="author" value="${archive.author}"/>
                标签：<input id="tag" name="tag" value="${archive.tag}"/>
                <br/><br/>
                <textarea class="form-control" id="preview" name="preview">${archive.preview}</textarea>
                <br/>
                <!-- 文档区域-->
                <div id="article_section" class="markdown-body">
                    <textarea id="simplemde">${archive.mdContent}</textarea>
                </div>
                <button class="btn btn-primary" type="button" onclick="submitArchive();">发布</button>
            </form>
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

    function submitArchive(){
        var mdContent = simplemde.value(),
        htmlContent = simplemde.markdown(mdContent);
        $.ajax({
            type:"post",
            url:"<%=basePath%>/archive/save",
            data:{
                id:$("#id").val(),
                title:$("#title").val(),
                author:$("#author").val(),
                tag:$("#tag").val(),
                preview:$("#preview").val(),
                mdContent:mdContent,
                htmlContent:htmlContent,
                state:2
            },
            success:function(res){
                alert(res);
            }
        });
    }
</script>
</body>
</html>
