<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Jason Yang's Blog </title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=basePath%>/gentelella/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=basePath%>/gentelella/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="<%=basePath%>/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=basePath%>/gentelella/build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>/editor.md-master/css/editormd.css" />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-coffee"></i> <span>Jason Yang's Blog</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<%=basePath%>/imgs/monkey.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>Jason Yang</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">

                  <li><a id="home_content_link" href="javascript:void(0)"><i class="fa fa-home"></i> 首页</a></li>
                  <li><a id="archive_management_link" href="javascript:void(0)"><i class="fa fa-book"></i> 文档管理</a></li>

                  <li><a><i class="fa fa-bookmark"></i> 标签管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%=basePath%>/gentelella/production/form.html">General Form</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-user"></i> 用户设置 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<%=basePath%>/gentelella/production/form.html">General Form</a></li>
                    </ul>
                  </li>

                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.jsp">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="<%=basePath%>/imgs/monkey.jpg" alt="">Jason Yang
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="<%=basePath%>/imgs/monkey.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="<%=basePath%>/imgs/monkey.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="<%=basePath%>/imgs/monkey.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="<%=basePath%>/imgs/monkey.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- 右侧内容-->
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="<%=basePath%>/gentelella/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=basePath%>/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=basePath%>/gentelella/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=basePath%>/gentelella/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="<%=basePath%>/gentelella/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="<%=basePath%>/gentelella/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- Flot -->
    <script src="<%=basePath%>/gentelella/vendors/Flot/jquery.flot.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/Flot/jquery.flot.time.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="<%=basePath%>/gentelella/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="<%=basePath%>/gentelella/vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<%=basePath%>/gentelella/vendors/moment/min/moment.min.js"></script>
    <script src="<%=basePath%>/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=basePath%>/gentelella/build/js/custom.min.js"></script>
    <script src="<%=basePath%>/gentelella/build/js/admin.js"></script>
    <script src="<%=basePath %>/editor.md-master/lib/jquery.flowchart.min.js"></script>
    <script src="<%=basePath %>/editor.md-master/src/editormd.js"></script>
    <script type="text/javascript">
      $(function(){
        /**
         * 绑定【首页】点击事件
         */
        $("#home_content_link").click(function(){
          replaceRightAreaContent("<%=basePath%>/homeContent");
        });

        /**
         * 默认点击【首页】
         */
        $("#home_content_link").click();

        /**
         * 绑定【文档管理】事件
         */
        $("#archive_management_link").click(function(){
          replaceRightAreaContent("<%=basePath%>/archiveList/1");
        });


      });
    </script>
  </body>
</html>
