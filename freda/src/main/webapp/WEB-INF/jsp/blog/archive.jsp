<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        <div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4">${archive.title}</h1>

            <style type="text/css">
                #span_tag{
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
                <a href="#"><span id="span_tag">&nbsp;${archive.tag}&nbsp;</span></a>&nbsp;${archive.author}&nbsp;|&nbsp;
                <fmt:formatDate value="${archive.createTime}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate>
            </div>
          </p>

          <hr>

          <!-- Preview Image -->
          <img class="img-fluid rounded" src="<%=basePath%>/images/car.png" alt="">

          <hr>
            <div id="archive_content" style="margin-top: 1em;">
                <c:out value="${archive.htmlContent}" escapeXml="false"/>
            </div>
          <hr>
            <!-- JiaThis Button BEGIN -->
            <div class="jiathis_style_32x32" style="margin-top: 1em; margin-bottom:1em;">
                <a class="jiathis_button_weixin"></a>
                <a class="jiathis_button_tsina"></a>
                <a class="jiathis_button_qzone"></a>
                <a class="jiathis_button_tqq"></a>
                <a href="http://www.jiathis.com/share?uid=2115022" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                <a class="jiathis_counter_style"></a>
            </div>
            <script type="text/javascript">
                var jiathis_config = {data_track_clickback:'true'};
            </script>
            <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=2115022" charset="utf-8"></script>
            <!-- JiaThis Button END -->
            <br/>
          <!-- Comments Form -->
          <div id="comment_tips"></div>
          <div class="card my-4">
            <h5 class="card-header">评论</h5>
            <div class="card-body">
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

        <!-- Sidebar Widgets Column -->
        <jsp:include page="commons/side-widget.jsp"/>
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
                            '    <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">' +
                            '        <div class="media-body">' +
                            '            <h5 class="mt-0" id="commenterName">' + res[i].commentUsername + '</h5>' +
                            '            <span>' + res[i].commentContent + '</span><br/>' + createTime +
                            '        </div>' +
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
