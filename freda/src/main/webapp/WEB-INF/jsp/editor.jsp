<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>NOCODER</title>

<!-- Bootstrap -->
<link href="<%=basePath %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>/bootstrap/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link href="<%=basePath %>/summernote/summernote.css" rel="stylesheet">
<script src="<%=basePath %>/summernote/summernote.min.js"></script>
<style type="text/css">
.label{
	cursor:pointer;
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
<div id="summernote">Hello <h1>Summernote</h1></div>
<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
  });
});
</script>
</body>
</html>