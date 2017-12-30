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

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Jason Yang's Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<%=basePath%>">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">
            <div id="article_section">

            </div>
            <div id="div_load" style="text-align: center; padding-top:2em;">
                <!--"加载中，查看更多"区域-->
            </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>

        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; NoCoder.Org 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=basePath%>/bootstrap-basic/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/bootstrap-basic/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
                            $("#article_section").append (
                                    '<div class="row">'
                                        + '<div class="col-lg-2">'
                                            + '<a href="archive/'+archives[i].id+'">'
                                            + '<img class="img-fluid rounded" src="' + path + '/phantom/images/pic0'+index+'.jpg"/>'
                                            + '<a/>'
                                        + '</div>'
                                        + '<div class="col-lg-10">'
                                            + '<a href="archive/'+archives[i].id+'">'
                                            + '<p class="lead" >'
                                                + archives[i].title
                                            + '</p>'
                                            + '<a/>'
                                            + '<p  onclick="" style="cursor: pointer">'+ archives[i].preview + '</p>'
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
                            $("#div_load").append('<a type="button" class="button small" onclick="loadArchives('+_page+');">加载更多<i class="icon-arrow-down"></i></a>');
                        }
                    }
            );
        }
    </script>
  </body>

</html>
