<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>

<jsp:include page="commons/head.jsp"/>
<body>
<!-- Navigation -->
<jsp:include page="commons/navigation.jsp"/>

<!-- Page Content -->
<div class="container">
    <div class="row">
        <!-- Post Content Column -->
        <div class="col-lg-12">
            <!-- 文档区域-->
            <div id="article_section"></div>
            <!-- loading -->
            <div id="div_load" style="text-align: center;padding-bottom:1em;"></div>
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<jsp:include page="commons/foot.jsp"/>
<script type="text/javascript">
    var _page = 1;
    $(function () {
        loadArchives(_page);
    });

    /**
     * 加载文档列表
     * @param page
     */
    function loadArchives(_page) {

        // $("#div_load").html('<div style="text-align: center;"><h3>Loading...</h3></div>');

        var path = "<%=basePath%>";
        $.post(
                path + "/archive_list",
                {page: _page},
                function (res) {
                    var archives = res.archiveList;
                    var index = 1;
                    $("#article_section").append("<div style='padding-top:2em; '/>");
                    for (var i = 0; i < archives.length; i++) {
                        if (index > 9) {
                            index = 1;
                        }
                        archives[i].createTime = new Date(archives[i].createTime).format("yyyy-MM-dd hh:mm");
                        $("#article_section").append(
                                '<div class="row">'
                                + '<div class="col-lg-12">'
                                + '<a href="archive/' + archives[i].id + '">'
                                + '<span style="font-size:1.2em;">'
                                + archives[i].title
                                + '</span>'
                                + '<a/>'
                                + '<br/>'
                                + '<span style="font-size:0.8em;color:dimgrey;">'
                                + archives[i].createTime + '  ' + archives[i].author
                                + '</span>'
                                + '<br/>'
                                + '<span style="color:dimgrey;padding-top: 0.2em;">' + archives[i].preview + '</span>'
                                + '</div>'
                                + '</div>'
                                + '<hr/>'
                        );
                        index++;
                    }
                    _page = res.page == res.totalPages ? -1 : res.page + 1;
                    $("#div_load").html("");
                    // _page == -1 表示已经是最后一页，不再显示查看更多
                    if (_page != -1) {
                        $("#div_load").append('<a class="btn btn-primary" href="javascript:void(0)"  onclick="loadArchives(' + _page + ');">Load more <span class="fa fa-angle-double-down"/><i class="icon-arrow-down"></i></a>');
                    }
                }
        );
    }
</script>

</body>

</html>
