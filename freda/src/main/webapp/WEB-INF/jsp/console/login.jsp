<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>NoCoder | 登录 </title>
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="<%=basePath%>/images/command.ico">
</head>

<body class="login">
<div class="container" style="margin-top: 10em;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-3 column">
                </div>
                <div class="col-md-6 column">
                    <form class="form-horizontal" role="form" method="post">
                        <div class="form-group">
                            <div class="col-sm-12" style="text-align: center;">
                                <div style="text-align: center;">
                                    <h3>
                                        Blog Console
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="input" class="form-control" id="username" name="username" placeholder="Username"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12" style="text-align: center;">
                                <button id="login_link" class="btn btn-success">Sign in</button>
                                <div style="text-align: center;margin-top: 2em;color: gray;">
                                    <p>© nocoder.org 2017</p>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="col-md-3 column">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

    $(function(){
        // 登录按钮点击事件
        $("#login_link").click(function(){
            $("#login_form").submit();
        });

        // 回车键提交表单
        $(document).keydown(function(event){
            if(event.keyCode == "13"){
                $("#login_link").click();
            }
        });

    });
</script>
</html>
