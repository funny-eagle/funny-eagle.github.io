<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE HTML>
<!--
Phantom by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Jason Yang's Blog</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--[if lte IE 8]>
    <script src="<%=basePath%>/phantom/assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/main.css"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie9.css"/><![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>/phantom/assets/css/ie8.css"/><![endif]-->
    <link rel="icon" href="<%=basePath%>/imgs/command.ico">
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp"/>

    <!-- Menu -->
    <jsp:include page="menu.jsp"/>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <header>
                <h2>即使你已经在正确的轨道上，但如果只是停止不前，也仍然会被淘汰出局。</h2>
            </header>
            <!--文档区域-->
            <section id="article_section" class="tiles">
            </section>

            <!--"加载中，查看更多"区域-->
            <div id="div_load" style="text-align: center; padding-top:2em;">
            </div>
            <c:choose>
                <c:when test="${totalPages != null }">
                    <section style="position:absolute;left:50%;margin-left:-5%; margin-top:3%;">
                        <ul class="actions">
                            <li>
                                <!--<a href="<%=basePath%>/archive_list?page=${page == totalPages ? page : page+1}" class="button">加载更多⬇️</a>-->
                                <input type="button" value="查看更多" class="special" />
                            </li>
                        </ul>
                    </section>
                </c:when>
            </c:choose>

        </div>

    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp"/>

</div>

<!-- Scripts -->
<script src="<%=basePath%>/phantom/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/phantom/assets/js/skel.min.js"></script>
<script src="<%=basePath%>/phantom/assets/js/util.js"></script>
<!--[if lte IE 8]>
<script src="<%=basePath%>/phantom/assets/js/ie/respond.min.js"></script><![endif]-->
<script src="<%=basePath%>/phantom/assets/js/main.js"></script>
<script type="text/javascript">
    var _page = 1;
    $(function () {
        loadArchives(_page);
    });

    /**
     * 加载文档
     * @param page
     */
    function loadArchives(_page){

        $("#div_load").append('<div style="text-align: center;"><h3>Loading...</h3></div>');
        var path = "<%=basePath%>";
        $.post(
                path + "/archive_list",
                {page: _page},
                function (res) {
                    var archives = res.archiveList;
                    var index = 1;
                    for (var i = 0; i < archives.length; i++) {
                        if(index > 9){
                            index = 1;
                        }
                        $("#article_section").append(
                                '<article class="style'+index+'">'
                                + '<span class="image">'
                                + '<img src="' + path + '/phantom/images/pic0'+index+'.jpg" alt=""/>'
                                + '</span>'
                                + '<a href="archive?id=' + archives[i].id + '">'
                                + '<h2>' + archives[i].title + '</h2>'
                                + '<div class="content">'
                                + '<p>' + archives[i].preview + '</p>'
                                + '</div>'
                                + '</a>'
                                + '</article>');
                        index ++;
                    }
                    _page = res.page == res.totalPages ? -1 : res.page+1;
                    $("#div_load").html("");
                    // _page == -1 表示已经是最后一页，不再显示查看更多
                    if(_page != -1){
                        $("#div_load").append('<input type="button" value="加载更多" class="button small" onclick="loadArchives('+_page+');"/>');
                    }
                }
        );
    }
</script>
</body>
</html>