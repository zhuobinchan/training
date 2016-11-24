<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
input[type="text"] {
	height: 26px !important;
	line-height: 26px !important;
	padding: 0 6px !important;
}
</style>
<link rel="stylesheet" href="../admin/css/bootstrap-select.css">
<script src="../admin/js/bootstrap-select.min.js"></script>
<script src="../admin/js/i18n/defaults-*.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$("#logo").uploadPreview({
			Img : "ImgPr",
			Width : 220,
			Height : 220
		});
	});
	
	function deleteObj(objId) {
		if (confirm("确定要删除这条数据吗?")) {
			$.post("AdminStory_deleteObject.action?mainPage=adminStory.jsp", {
				id : objId
			}, function(result) {
				if (result.message.trim()=="true") {
					alert("数据删除成功！");
					window.location.reload(true);
				} else {
					alert("数据删除失败！");
				}
			});
		}
	}
	function changeStoryStatus(objId) {
		if (confirm("确定要修改这条数据吗?")) {
			$.post("AdminStory_changeStoryStatus.action?mainPage=adminStory.jsp", {
				id : objId
			}, function(result) {
				if (result.message.trim()=="true") {
					alert("数据修改成功！");
					window.location.reload(true);
				} else {
					alert("数据修改失败！");
				}
			});
		}
	}
	
	function deleteObjs() {
		var selectedSpan = $(".checked").parent().parent().next("td");
		if (selectedSpan.length == 0) {
			alert("请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedSpan.length; i++) {
			strIds.push(selectedSpan[i].attributes["myids"].nodeValue);
		}
		var ids = strIds.join(",");
		if (confirm("您确定要删除这" + selectedSpan.length + "条数据吗？")) {
			$.post("AdminStory_deleteObjects.action?mainPage=adminStory.jsp", {
				ids : ids
			}, function(result) {
				if (result.message.trim()=="true") {
					alert("批量数据已成功删除！");
					location.reload(true);
				} else {
					alert("批量数据删除失败！");
				}
			}, "json");
		} else {
			return;
		}
	}
	
	function changeStoryStatusByIds() {
		var selectedSpan = $(".checked").parent().parent().next("td");
		if (selectedSpan.length == 0) {
			alert("请选择要修改的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedSpan.length; i++) {
			strIds.push(selectedSpan[i].attributes["myids"].nodeValue);
		}
		var ids = strIds.join(",");
		if (confirm("您确定要修改这" + selectedSpan.length + "条数据吗？")) {
			$.post("AdminStory_changeStoryStatusByIds.action?mainPage=adminStory.jsp", {
				ids : ids
			}, function(result) {
				if (result.message.trim()=="true") {
					alert("批量数据已成功修改！");
					location.reload(true);
				} else {
					alert("批量数据修改失败！");
				}
			}, "json");
		} else {
			return;
		}
	}
	
	function searchFunc(){
		
// 		var search_content = {
// 			name:"",
// 			telephone:"",
// 			organization.id:""
// 		};
		
		var search_title = $("#search_title").val();
		var search_status = $("#search_status").val();
		var search_accountNum = $("#search_accountNum").val();
		
		var str = "{'title':'"+search_title+"',"
			      +"'status':'"+search_status+"',"
			      +"'person.accountNum':'"+search_accountNum+"'}";
		
// 		$("#searchContent").val(JSON.stringify(search_content));
		$("#searchContent").val(str);
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
				
				<form id="search_fm" action="AdminStory_findPageByMap?mainPage=adminStory.jsp&findPageTarget=/admin/AdminStory_findPageByMap" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 故事名： <input id="search_title" name="story.title" value="" type="text"
					class="input-medium search-query" placeholder="输入故事名称...">
				<!-- &nbsp; 故事状态： <select id="search_status"
					name="story.status">
					<option value="">请选择...</option>
					<option value="0">上架</option>
					<option value="1">下架</option>
				</select>
				用户账号：<input id="search_accountNum" name="person.accountNum" value="" type="text"
					class="input-medium search-query" placeholder="输入用户账号...">&nbsp;
					 -->
				<input id="searchContent" name="searchContent" type="hidden" value="">	
				<button type="button" class="btn btn-primary" title="Search" onclick="searchFunc()">
					查询&nbsp;<i class="icon  icon-search"></i>
				</button>
				<br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<button class="btn btn-primary" type="button" data-backdrop="static"
					data-toggle="modal" data-target="#dlg"
					onclick="return openAddDlg()">添加资源</button>
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" role="button"
					class="btn btn-danger" onclick="javascrip:deleteObjs()">批量删除</a>
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" role="button"
					class="btn btn-danger" onclick="javascrip:changeStoryStatusByIds()">批量上下架</a>
			</form>
		
				
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>资源管理</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>故事标题</th>
									<th>故事状态</th>
									<th>所属用户账号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results }" var="story" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${story.storyId }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${story.title }</td>
										<td style="text-align: center;vertical-align: middle;">${story.status!=1?"下架":"上架" }</td>
										<td style="text-align: center;vertical-align: middle;">${story.person.accountNum }</td>
										
										<td style="text-align: center;vertical-align: middle;">
											<a class="btn btn-info" href="#">编辑</a>&nbsp;&nbsp;
											<button class="btn btn-danger" type="button"
												onclick="javascript:deleteObj('${story.storyId }')">删除</button>
											<button class="btn btn-danger" type="button"
												onclick="javascript:changeStoryStatus('${story.storyId }')">上架下架</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div>


			</div>
		</div>
		
	</div>
</body>
</html>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jedate/jedate.js"></script>
<script type="text/javascript">
	
</script>