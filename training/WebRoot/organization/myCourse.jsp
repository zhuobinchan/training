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
<link rel="stylesheet" href="../organization/css/bootstrap-select.css">
<script src="../organization/js/bootstrap-select.min.js"></script>
<script src="../organization/js/i18n/defaults-*.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/organization/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/organization/js/uploadPreview.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$("#headUrl").uploadPreview({
			Img : "ImgPr",
			Width : 220,
			Height : 220
		});
	});
	function openAddDlg() {
		$("#myModalLabel").html("添加课程");
		$("#fm").attr("action","organizationCourse_saveObject.action");
		resetValue();
	}
	function saveBroadcast() {
		var v =  $(".filter-option").text();
		$("#lablename").attr("value",v);
		
		if ($("#name").val() == null
				|| $("#name").val() == '') {
			$("#error").html("请输入课程名字账号！");
			$("#accountNum").focus();
			return false;
		}
			
		
				
		/* $.post("Section_save.action", $("#fm").serialize()); */
		$("#fm").submit();
		alert("保存成功！");
	}
	
	function modify(courseId,name,lumpId,introduction,imageUrl) {

		var introduction_removeEnter = introduction.replace(/\[enter\]/g,"\n");
		
		$("#fm").attr("action","organizationCourse_saveOrUpdateObject.action");
		$("#name").val(name);
		$("#courseId").val(courseId);
		$("#lumpId").val(lumpId);
		$("#introduction").val(introduction_removeEnter);
		$("#ImgPr").attr("src", "${pageContext.request.contextPath}/" + imageUrl);
	}
	function deleteObj(objId) {
		if (confirm("确定要删除这条数据吗?")) {
			$.post("organizationTeacher_deleteObject.action?mainPage=organizationOrganization.jsp", {
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
			$.post("organizationTeacher_deleteObjects.action?mainPage=organizationOrganization.jsp", {
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
	function resetValue() {
		$("#name").val("");
		$("#headUrl").val("");
	}
	function searchFunc(){
		
// 		var search_content = {
// 			name:"",
// 			lumpId:""
// 			organization.id:""
// 		};
		
		var search_name = $("#search_name").val();
		var search_lump = $("#search_lump").val();
		
		var str = "{'name':'"+search_name+"',"
			      +"'lump.lumpId':'"+search_lump+"'}";
		
// 		$("#searchContent").val(JSON.stringify(search_content));
		$("#searchContent").val(str);
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="Organization_FilterCourse" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 课程名： <input id="search_name"  type="text"
					class="input-medium search-query" placeholder="输入课程名...">
				&nbsp; 所属板块： <select id="search_lump">
						<option value="">请选择...</option>
					<c:forEach var="lump" items="${lumps }">
						<option value="${lump.lumpId }">${lump.name }</option>
					</c:forEach>
				</select>&nbsp;
				<input id="searchContent" name="searchContent" type="hidden" value="">	
				<button type="button" class="btn btn-primary" title="Search" onclick="searchFunc()">
					查询&nbsp;<i class="icon  icon-search"></i>
				</button>
				<br> <br>
				<button class="btn btn-primary" type="button" data-backdrop="static"
					data-toggle="modal" data-target="#dlg"
					onclick="return openAddDlg()">添加教师</button>
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" role="button"
					class="btn btn-danger" onclick="javascrip:deleteObjs()">批量删除</a>
			</form>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>课程管理</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>课程名</th>
									<th>发布时间</th>
									<th>课程图片</th>
									<th>所属板块</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results}" var="course" varStatus="idx">
									<tr>
										<td><input type="checkbox" value="${course.courseId }"/></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${course.courseId }">${(page-1)*6+idx.index+1 }</td>

										<td style="text-align: center;vertical-align: middle;">${course.name }</td>
										<td style="text-align: center;vertical-align: middle;">${course.publishTime }</td>
										<td
											style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;"
											src='${pageContext.request.contextPath}/${course.imageUrl }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">${course.lump.name }</td>
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												<%
												    request.setAttribute("vEnter", "\r\n");   
												    request.setAttribute("nEnter", "[enter]");
												%> 
												onclick="return modify('${course.courseId }','${course.name }','${course.lump.lumpId }','${course.introduction }','${course.imageUrl }')">修改
											</button>&nbsp;&nbsp;
											<button class="btn btn-danger" type="button"
												onclick="javascript:deleteObj('${teacher.pid }')">删除</button>
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
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">课程信息添加或修改</h3>
			</div>
			<div class="modal-body">
				<form id="fm"
					action="organizationCourse_saveObject.action"
					method="post" enctype="multipart/form-data">
					<table>

						<tr>
							 <input id="courseId" type="hidden" name="course.courseId">
							 <input id="currentPage" type="hidden" name="currentPage" value="${page }">
							<td><label class="control-label" for="name">课程名：</label>
							</td>
							<td><input id="name" type="text"
								name="course.name" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="lumpId">所属机构：</label>
							</td>
							<td><select id="lumpId"
								name="course.lump.lumpId"><option value="">请选择...</option>
									<c:forEach var="lump" items="${lumps }">
										<option value="${lump.lumpId }">${lump.name }</option>
									</c:forEach>
							</select></td>
						</tr>
						
						<tr>
							<td><img id="ImgPr" class="pull-left"
								style="width: 120px; height: 120px;"
								src="${pageContext.request.contextPath}/" /></td>
							<td></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="headUrl">上传图片：</label></td>
							<td><input type="file" id="headUrl" name="img"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="introduction">课程简介：</label>
							</td>
							<td>
							<textarea id="introduction" rows="5" cols="50" style="width: 300px;"  name="course.introduction"></textarea>
							</td>
						</tr>

					</table>
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveBroadcast()">保存</button>
				<!-- <button class="btn btn-primary" type="submit">保存</button> -->
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jedate/jedate.js"></script>
<script type="text/javascript">
	jeDate({
		dateCell : "#dateinfo",
		isinitVal : true,
		isTime : true, //isClear:false,
		minDate : "2014-09-19 00:00:00",
		okfun : function(val) {
			alert(val)
		}
	})

	jeDate({
		dateCell : "#startinfo",
		isinitVal : true,
		isTime : true, //isClear:false,
		minDate : "2014-09-19 00:00:00",
		okfun : function(val) {
			alert(val)
		}
	})

	$("#jedatebox").css("z-index", "99999");
</script>