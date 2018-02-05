<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- Bootstrap core JavaScript -->
<script src="<%=basePath%>/bootstrap-basic/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/bootstrap-basic/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>/bootstrap-basic/dateformat.js"></script>
<link href="<%=basePath%>/font-awesome/css/font-awesome.min.css"/>
<script src="<%=basePath%>/simplemde/dist/simplemde.min.js"></script>
<link href="<%=basePath%>/simplemde/dist/simplemde.min.css"/>
<form id="archiveForm" role="form" action="<%=basePath%>/archive/save" method="post">
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
						class="form-control" id="tag" name="tag" maxlength="10"
						placeholder="输入标签，多个标签使用英文状态下的逗号分隔" value="${archive.tag }">
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="form-group">
					<label for="preview">预览</label> <span style="color:grey;font-size:8px;">最大长度200个字符</span>
					<textarea rows="3" required
						class="form-control" id="preview" name="preview">${archive.preview }</textarea>
				</div>
			</div>
		</div>
		<div id="test-editormd" class="form-group">
            <textarea name="mdContent" id="mdContent" cols="30" rows="10">${archive.mdContent }</textarea>
		</div>

		<script type="text/javascript">
			$(function() {
                var simplemde = new SimpleMDE({
                    element: document.getElementById("mdContent"),
                    autoDownloadFontAwesome: false,
                    status: false
                });
			});
		</script>

		<div style="text-align: center;">
			<button id="btn_save_article" type="button" onclick="submitArchive(1);" class="btn btn-success">保存为草稿</button>
			<button id="btn_subm_article" type="button" onclick="submitArchive(2);" class="btn btn-primary" style="margin-left:20px;">发布到博客</button>
		</div>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 保存/发布文档
	 * @param status
	 */
	function submitArchive (status) {
		$("#btn_save_article").attr("disabled","true");
        $("#btn_subm_article").attr("disabled","true");
		$("#state").val(status);
        if(status == 1){
            $("#btn_save_article").text("保存中...");
        }else{
            $("#btn_subm_article").text("提交中...");
        }
		$.post(
				"<%=basePath%>/archive/save",
				{
                    id : $("#id").val(),
					state : $("#state").val(),
					title : $("#title").val(),
					author : $("#author").val(),
					tag : $("#tag").val(),
					preview : $("#preview").val(),
					mdContent : $("#mdContent").val(),
					htmlContent : $("#htmlContent").text()
				},

				function(result){
					if(result == "success"){
                        // 重新加载文档列表
                        setTimeout('replaceRightAreaContent("<%=basePath%>/archiveList/1");',2000);
					}
				}
		);
	}
</script>