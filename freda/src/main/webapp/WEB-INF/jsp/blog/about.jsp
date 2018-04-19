<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<title>Nocoder - About</title>
<jsp:include page="commons/head.jsp"/>
<body>
<!-- Navigation -->
<jsp:include page="commons/navigation.jsp"/>
<!-- Page Content -->
<div class="container">
    <div class="row" style="padding-top:2em;">
        <div class="col-lg-8">
            <h2>Jason Yang</h2>
            <p>E-Mail:<a href="mailto:yangjinlong86@126.com">yangjinlong86@126.com</a></p>
            <p>Github:<a target="_blank" href="https://github.com/yangjinlong86">https://github.com/yangjinlong86</a></p>
            <p>Website:<a target="_blank" href="http://nocoder.org">http://nocoder.org</a></p>
            <p>QQ/WeChat:88131182</p>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="commons/foot.jsp"/>
</body>

</html>
