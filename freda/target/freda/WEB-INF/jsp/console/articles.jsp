<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<script src="<%=basePath%>/gentelella/build/js/admin.js"></script>

<div style="text-align:left;margin-left:15px; float:left;">
    <a id="addArticle" class="btn btn-primary" href="javascript:void(0);">写文章</a>
</div>
<!--
<div style="text-align:right;margin-left:15px;float:right;"><a class="btn btn-warning" href="javascript:void(0);" onclick="refreshCache();">刷新缓存</a></div>
-->

<table class="table table-responsive table-striped table-hover" style="margin:1em; width:98%;" >
	<thead align="center">
		<tr>
			<th width="30%">标题</th>
			<th width="10%">作者</th>
			<th width="10%">标签</th>
			<th width="20%">创建日期</th>
			<th width="10%">发布状态</th>
			<th width="10%" style="text-align: center;"> 操作 </th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${archiveList }" var="archive">
			<tr>
				<td>${archive.title }</td>
				<td>${archive.author }</td>
				<td>${archive.tag }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
						value="${archive.createTime }" /></td>
				<td>${archive.state == 1 ? "草稿" : "已发布" }</td>
				<td style="text-align: center;">
					<a id="edit_archive_link" href="javascript:void(0);" onclick="editArchive('${archive.id}');">编辑</a>&nbsp;&nbsp;&nbsp;
					<a data-toggle="modal" data-target="" href="#delCfmModal">删除</a>
                    <input type="hidden" id="archiveId" value="${archive.id}"/>

                    <!-- Modal -->
                    <div class="modal" id="delCfmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                                </div>
                                <div class="modal-body">
                                    确定要删除?
                                </div>
                                <div class="modal-footer">
                                    <a type="button" class="btn btn-default" data-dismiss="modal">取消</a>
                                    <a href="javascript:void(0);" type="button" data-dismiss="modal" class="btn btn-primary btn-del-ok" onclick="delArchive();">删除</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div style="text-align: center;">
	<ul class="pagination">
		<li><a href="javascript:void(0);"
               onclick="replaceRightAreaContent('<%=basePath%>/archiveList/${(page==1) ? page : page-1}');">上一页</a></li>
		<c:forEach var="i" begin="1" end="${totalPages}">
			<li><a  href="javascript:void(0);"
                    onclick="replaceRightAreaContent('<%=basePath%>/archiveList/${i}');">${i}</a></li>
		</c:forEach>
		<li><a href="javascript:void(0);"
               onclick="replaceRightAreaContent('<%=basePath%>/archiveList/${page == totalPages ? page : page+1}');">下一页</a></li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		$("#addArticle").click(function(){
			replaceRightAreaContent("<%=basePath%>/admin/editor");
		});
	});

	function editArchive(id){
		var htmlObj = $.ajax({
			url:"<%=basePath%>/archive/edit/"+id,
			async:false
		});
		$(".right_col").html(htmlObj.responseText);
	}

    function delArchive(){
        var url = "<%=basePath%>/archive/delete/"+$("#archiveId").val();
        window.location.href = url;
    }

</script>