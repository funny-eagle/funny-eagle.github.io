<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>博客管理系统</title>
<link rel="icon" href="<%=basePath%>/imgs/command.ico">
<link rel="stylesheet" href="<%=basePath %>/editor.md-master/css/editormd.css" />
<!-- Bootstrap -->
<link href="<%=basePath %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath %>/editor.md-master/lib/jquery.flowchart.min.js"></script>
<script src="<%=basePath %>/editor.md-master/src/editormd.js"></script>
<style type="text/css">
.label {
	cursor: pointer;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<%=basePath %>/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<img alt="" src="<%=basePath%>/imgs/nocoder-logo.png" class='img-responsive' style="border:1em;border-radius:3em;height:3em;width: 3em;float: left;margin-top: 4px;"/>
			<a class="navbar-brand" href="<%=basePath %>/admin" style="float:left;">返回</a>
		</div>
		<div>
			<p class="navbar-text">文章编辑</p>
		</div>
	</nav>
	<form id="archiveForm" role="form" action="<%=basePath %>/archive/save" method="post">
		<div style="margin:1em;">
			<input type="hidden" name="id" id="id" value="${archive.id }"/>
			<input type="hidden" name="state" id="state" value="${archive.state}"/>
			<div class="row clearfix">
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="title">标题</label> <span style="color:grey;font-size:8px;">最大长度30个字符</span>
						<input type="text" maxlength="30" required class="form-control" id="title" name="title" placeholder="请输入标题" value="${archive.title }">
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="author">作者</label> <span style="color:grey;font-size:8px;">最大长度20个字符</span>
						<input type="text" required maxlength="20" 
							class="form-control" id="author" name="author"
							placeholder="请输入作者" value="${archive.author }">
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="tag">标签</label> <span style="color:grey;font-size:8px;"></span>
						<input type="text" required
							class="form-control" id="标签" name="tag" maxlength="10" 
							placeholder="输入标签，多个标签使用英文状态下的逗号分隔" value="${archive.tag }">
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="form-group">
						<label for="preview">预览</label> <span style="color:grey;font-size:8px;">最大长度200个字符</span>
						<textarea rows="3" required
							class="form-control" id="预览" name="preview">${archive.preview }</textarea>
					</div>
				</div>
			</div>
			<div id="test-editormd" class="form-group">
				<!-- preview 保存markdown代码-->
				<textarea id="mdContent" name="mdContent">${archive.mdContent }</textarea>

				<!-- content保存html代码-->
                <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                <textarea id="htmlContent" class="editormd-html-textarea" name="htmlContent"></textarea>
			</div>

			<script type="text/javascript">
				$(function() {
					var testEditor = editormd("test-editormd", {
						path : '<%=basePath %>/editor.md-master/lib/',
                        height:400,
                        saveHTMLToTextarea : true
					});
				});
			</script>

			<div style="text-align: center;">
				<button id="btn_save_article" type="button" onclick="saveArchive();" class="btn btn-success">保存为草稿</button>
				<button id="btn_subm_article" type="button" onclick="submitArchive();" class="btn btn-primary" style="margin-left:20px;">发布到博客</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		// 保存为草稿
		function saveArchive () {
			$("#btn_save_article").attr("disabled","true");
			$("#state").val(1);
			$("#archiveForm").submit();
			$("#btn_save_article").attr("disabled","false");
		}
		// 发布文章
		function submitArchive () {
			$("#btn_save_article").attr("disabled","true");
			$("#state").val(2);
			$("#archiveForm").submit();
			$("#btn_save_article").attr("disabled","false");
		}
	</script>
</body>

</html>