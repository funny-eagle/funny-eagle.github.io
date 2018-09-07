<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<title>NoCoder - ${archive.title}</title>
<link href="<%=basePath%>/vendor/github-markdown/github-markdown.css" rel="stylesheet">
<jsp:include page="commons/head.jsp"/>
<body>
<!-- Navigation -->
<jsp:include page="commons/navigation.jsp"/>
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4">${archive.title}</h1>

            <style type="text/css">
                .span_tag{
                    color:#6496e7;
                    border:1px solid;
                    border-radius: 5px;
                    margin-right: 3px;
                    padding:1px;
                    letter-spacing:1px;
                }
            </style>
          <!-- Author -->
          <p class="lead">
            <div style="color: #969696;">
                <a href="#"><span id="span_tag" class="span_tag">&nbsp;${archive.tag}&nbsp;</span></a>&nbsp;${archive.author}&nbsp;|&nbsp;
                <fmt:formatDate value="${archive.createTime}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate>
            </div>
          </p>

          <hr>
            <div id="archive_content" style="margin-top: 1em;" class="markdown-body">
                <c:out value="${archive.htmlContent}" escapeXml="false"/>
            </div>
            <div style="text-align: center"><a href="<%=basePath%>"><span class="symbol fa fa-home"></span> Back to home</a><br/></div>
          <hr>
          <!-- Comments Form -->
          <div id="comment_tips"></div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        评论
                    </h3>
                </div>
                <div class="panel-body" id="recentlyArchiveList">
                    <form>
                        <div class="form-group">
                            <input id="commentUsername" class="form-control" type="text"  value="" placeholder="请输入您的昵称">
                            <span id="commentUsernameTips" style="color: orangered"></span>
                        </div>
                        <div class="form-group">
                            <textarea id="commentContent" class="form-control" rows="3" placeholder="请输入评论内容"></textarea>
                            <span id="commentContentTips" style="color: orangered"></span>
                        </div>
                        <button id="submitCommentBtn" type="button" class="btn btn-primary" onclick="saveComment();">提交</button>
                    </form>
                </div>
            </div>

          <!-- 评论区域 -->
          <div id="comments_fields"></div>

        </div>

        <div class="col-lg-4" style="padding-top:2em;">
            <!-- Sidebar Widgets Column -->
            <jsp:include page="commons/side-widget.jsp"/>
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <jsp:include page="commons/foot.jsp"/>
    <script>
        var archiveId = "${archive.id}";
        $(function(){
            queryComments(archiveId);
        });

        /**
         *根据文档ID查询评论
         */
        function queryComments(archiveId){
            $.ajax({
                url:"<%=basePath%>/queryCommentsByArchiveId/" + archiveId,
                success: function(res){
                    showComments(res);
                }
            });
        }

        /**
         * 遍历评论数据,展示到页面
         */
        function showComments(res) {
            if (res != null && res.length > 0) {
                $("#comments_fields").html("");
                for (var i = 0; i < res.length; i++) {
                    var createTime = new Date(res[i].createTime).format("yyyy-MM-dd hh:mm");
                    $("#comments_fields").append(
                            '<div class="media mb-4">' +
                            '   <div class="media-body">' +
                            '       <span class="fa fa-user"> ' +  res[i].commentUsername + '</span>'+
                            '       <span id="commenterName">' + ' | ' + createTime + '</span><br/>' +
                            '       <span>' + res[i].commentContent + '</span>'+
                            '   </div>' +
                            '</div>'
                    );
                }
            }
        }

        /**
         * 保存评论
         */
        function saveComment(){
            var commentUsername = htmlEncode($("#commentUsername").val());
            var commentContent = htmlEncode($("#commentContent").val());
            // 评论昵称及内容校验
            if(!validateComment(commentUsername, commentContent)){
                return;
            }
            $("#submitCommentBtn").attr("disabled","true");
            $.ajax({
                type:"post",
                url:"<%=basePath%>/saveComment",
                data:{
                    "archiveId":archiveId,
                    "commentUsername": commentUsername,
                    "commentContent": commentContent
                },
                success:function(res){
                    if("success" == res){
                        $("#submitCommentBtn").attr("disabled",false);
                        $("#comment_tips").html(
                                '<div class="hidden alert alert-success alert-dismissable" style="margin-top: 1.5em;">'+
                                    '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"> &times;'+
                                    '</button>评论提交成功!'+
                                '</div>'
                        );
                        $("#commentUsername").val("");
                        $("#commentContent").val("");
                        // 评论保存成功后刷新评论列表
                        queryComments(archiveId);
                    }

                }
            });
        }

        function validateComment(commentUsername, commentContent){
            if(commentUsername == "" || commentContent == "" || commentUsername.trim() == "" || commentContent.trim() == ""){
                $("#commentContentTips").html("昵称和内容都不能为空");
                return false;
            }
            if(commentUsername.length>50){
                $("#commentContentTips").html("朋友,昵称也太长了吧?");
                return false;
            }
            if(commentContent.length>3000){
                $("#commentContentTips").html("朋友,你这也评论也太长了,走点心,三千字够不够?");
                return false;
            }
            $("#commentContentTips").html("");
            return true;
        }

        function htmlEncode(str) {
            var div = document.createElement("div");
            div.appendChild(document.createTextNode(str));
            return div.innerHTML;
        }
        function htmlDecode(str) {
            var div = document.createElement("div");
            div.innerHTML = str;
            return div.innerHTML;
        }
    </script>
  </body>

</html>
