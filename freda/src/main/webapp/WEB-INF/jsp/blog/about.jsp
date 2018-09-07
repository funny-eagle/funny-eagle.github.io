<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<title>NoCoder - About</title>
<jsp:include page="commons/head.jsp"/>
<body>
<!-- Navigation -->
<jsp:include page="commons/navigation.jsp"/>
<!-- Page Content -->
<div class="container">
    <div class="row" style="padding-top:2em;">
        <div class="col-lg-8">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-2 column">
                        <img class="img-rounded" height="150em;" width="150em;" src="https://raw.githubusercontent.com/jasonyang86/nocoder/master/data/images/201805/nocoder_monkey.jpeg">
                    </div>
                    <div class="col-md-10 column">
                        <blockquote>
                            <ul>
                                <li>
                                    NoCoder = Not Only a Coder
                                </li>
                                <li>
                                    E-Mail:<a href="mailto:yangjinlong86@126.com">yangjinlong86@126.com</a>
                                </li>
                                <li>
                                    Github:<a target="_blank" href="https://github.com/yangjinlong86">https://github.com/yangjinlong86</a>
                                </li>
                                <li>
                                    Website:<a target="_blank" href="http://nocoder.org">http://nocoder.org</a>
                                </li>

                            </ul>
                        </blockquote>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="commons/foot.jsp"/>
</body>

</html>
