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
<title>NOCODER-ADMIN</title>

<!-- Bootstrap -->
<link href="<%=basePath %>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link href="<%=basePath %>/summernote/summernote.css" rel="stylesheet">
<script src="<%=basePath %>/summernote/summernote.min.js"></script>

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
	<form role="form" action="<%=basePath %>/article/save"
		method="post">
		<div class="container">
			<h2>
				NOCODER <small>文章编辑</small>
			</h2>
			<input type="hidden" name="id" id="id" value="${article.id }"/>
			<div class="row clearfix">
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="title">标题</label> <span style="color:grey;font-size:8px;">最大长度20个字符</span>
						<input type="text" maxlength="20" required class="form-control" id="title" name="title" placeholder="请输入标题" value="${article.title }">
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="author">作者</label> <span style="color:grey;font-size:8px;">最大长度20个字符</span>
						<input type="text" required maxlength="20" 
							class="form-control" id="author" name="author"
							placeholder="请输入作者" value="${article.author }">
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="form-group">
						<label for="tag">标签</label> <span style="color:grey;font-size:8px;">最大长度20个字符</span>
						<input type="text" required
							class="form-control" id="标签" name="tag" maxlength="10" 
							placeholder="输入标签，多个标签使用英文状态下的逗号分隔" value="${article.tag }">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="preview">预览</label>
				<textarea id="preview" name="preview">${article.preview }</textarea>
			</div>
			<div class="form-group">
				<label for="content">正文</label>
				<textarea id="content" name="content">${article.content }</textarea>
			</div>
			 
			<script type="text/javascript">
				$(document).ready(function() {
				  $('#content').summernote({
					  height: 300,                 // set editor height
					  minHeight: null,             // set minimum height of editor
					  maxHeight: null,             // set maximum height of editor
					  focus: true                  // set focus to editable area after initializing summernote
				  });
				  $('#preview').summernote({
					  height: 200,                 // set editor height
					  minHeight: null,             // set minimum height of editor
					  maxHeight: null,             // set maximum height of editor
					  focus: true                  // set focus to editable area after initializing summernote
				  });
				});
			</script>
			
			
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary">发布文章</button>
			</div>
		</div>
	</form>
</body>

</html>