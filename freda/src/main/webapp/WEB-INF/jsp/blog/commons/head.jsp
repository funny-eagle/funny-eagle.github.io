<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/6
  Time: 上午12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/blog/css/blog-post.css" rel="stylesheet">
    <link rel="icon" href="<%=basePath%>/images/command.ico">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <style>
        a {
            color:#3b6caa;
            text-decoration:none;
        }
        a:visited {
            color:#4178be;
            text-decoration:none;
        }

    </style>
    <style type="text/css">
        .span_tag{
            color:#6496e7;
            border:1px solid;
            border-radius: 5px;
            margin-right: 3px;
            padding:1px;
            letter-spacing:1px;
            font-size:0.8em;
        }
    </style>
</head>
