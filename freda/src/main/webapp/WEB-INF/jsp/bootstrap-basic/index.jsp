<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
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
            <div id="article_section">

            </div>
            <div id="div_load" style="text-align: center;padding-bottom:1em;">
                <!--"加载中，查看更多"区域-->
            </div>
        </div>
        <!--side widget-->
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
    <script src="<%=basePath%>/bootstrap-basic/dateformat.js"></script>
    <script type="text/javascript">
        var _page = 1;
        $(function () {
            loadArchives(_page);
        });

        /**
         * 加载文档列表
         * @param page
         */
        function loadArchives(_page){

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
                            if(index > 9){
                                index = 1;
                            }
                            archives[i].createTime = new Date(archives[i].createTime).format("yyyy-MM-dd hh:mm");
                            $("#article_section").append (
                                    '<div class="row">'
                                        + '<div class="col-lg-2">'
                                            + '<a href="archive/'+archives[i].id+'">'
                                            + '<img class="img-fluid rounded" src="' + path + '/imgs/pic01.jpg"/>'
                                            + '<a/>'
                                        + '</div>'
                                        + '<div class="col-lg-10">'
                                            + '<a href="archive/'+archives[i].id+'">'
                                            + '<span style="font-size:1.2em;">'
                                                + archives[i].title
                                            + '</span>'
                                            + '<a/>'
                                            + '<br/>'
                                            + '<span style="font-size:0.8em;color:dimgrey;">'
                                            + archives[i].createTime + '  '+ archives[i].author
                                            + '</span>'
                                            + '<br/>'
                                            + '<span style="color:dimgrey;font-style: italic;padding-top: 0.2em;">'+ archives[i].preview + '</span>'
                                        + '</div>'
                                    + '</div>'
                                    + '<hr/>'
                            );
                            index ++;
                        }
                        _page = res.page == res.totalPages ? -1 : res.page+1;
                        $("#div_load").html("");
                        // _page == -1 表示已经是最后一页，不再显示查看更多
                        if(_page != -1){
                            $("#div_load").append('<a class="btn btn-info" href="javascript:void(0)"  onclick="loadArchives('+_page+');">加载更多››<i class="icon-arrow-down"></i></a>');
                        }
                    }
            );
        }
    </script>

  </body>

</html>
