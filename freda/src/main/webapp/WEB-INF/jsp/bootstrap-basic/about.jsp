<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Jason Yang's Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/bootstrap-basic/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=basePath%>/bootstrap-basic/css/blog-post.css" rel="stylesheet">
    <link rel="icon" href="<%=basePath%>/imgs/command.ico">
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

<body>

<!-- Navigation -->
<jsp:include page="navigation.jsp"/>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">


            <div class="card my-4">
                <h5 class="card-header">About me</h5>
                <div class="card-body">
                    <h2>杨金龙（Jason Yang）</h2>
                    <p>来自新疆, 80后, 喜欢编程, 弹吉他</p>
                    <p>Mail:<a href="mailto:yangjinlong86@126.com">yangjinlong86@126.com</a></p>
                    <p>Github:<a target="_blank" href="https://github.com/yangjinlong86">https://github.com/yangjinlong86</a></p>
                    <p>Blog:<a target="_blank" href="http://nocoder.org">http://nocoder.org</a></p>
                    <p>QQ/微信:88131182</p>
                </div>
            </div>
            <div id="div_load" style="text-align: center;padding-bottom:1em;">
                <!--"加载中，查看更多"区域-->
            </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <jsp:include page="side-widget.jsp"/>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; NoCoder.Org 2017
            <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1257391581'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1257391581%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
        </p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="<%=basePath%>/bootstrap-basic/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/bootstrap-basic/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
