<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<jsp:include page="commons/head.jsp"/>
<body>
<!-- Navigation -->
<jsp:include page="commons/navigation.jsp"/>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <!-- Post Content Column -->
        <div class="col-lg-8">
            <div class="card my-4">
                <h5 class="card-header">About me</h5>
                <div class="card-body">
                    <h2>Jason Yang</h2>
                    <p>E-Mail:<a href="mailto:yangjinlong86@126.com">yangjinlong86@126.com</a></p>
                    <p>Github:<a target="_blank" href="https://github.com/yangjinlong86">https://github.com/yangjinlong86</a></p>
                    <p>Website:<a target="_blank" href="http://nocoder.org">http://nocoder.org</a></p>
                    <p>QQ/WeChat:88131182</p>
                </div>
            </div>
            <div id="div_load" style="text-align: center;padding-bottom:1em;">
                <!--"加载中，查看更多"区域-->
            </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <jsp:include page="commons/side-widget.jsp"/>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="commons/foot.jsp"/>
</body>

</html>
