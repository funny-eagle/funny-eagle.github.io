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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="<%=basePath%>"><span class="symbol fa fa-code"></span><span class="title">Jason Yang's Blog</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<%=basePath%>">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=basePath%>/about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=basePath%>/contact">Contact</a>
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
            <div id="div_load" style="text-align: center;padding-bottom:1em;">
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
                            archives[i].createTime = new Date(archives[i].createTime).format("yyyy-MM-dd hh:mm");
                            $("#article_section").append (
                                    '<div class="row">'
                                        + '<div class="col-lg-2">'
                                            + '<a href="archive/'+archives[i].id+'">'
                                            + '<img class="img-fluid rounded" src="' + path + '/phantom/images/pic0'+index+'.jpg"/>'
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

        Date.prototype.format = function(fmt) {
            var o = {
                "M+" : this.getMonth()+1,                 //月份
                "d+" : this.getDate(),                    //日
                "h+" : this.getHours(),                   //小时
                "m+" : this.getMinutes(),                 //分
                "s+" : this.getSeconds(),                 //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S"  : this.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt)) {
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            }
            for(var k in o) {
                if(new RegExp("("+ k +")").test(fmt)){
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
                }
            }
            return fmt;
        }
    </script>
  </body>

</html>
