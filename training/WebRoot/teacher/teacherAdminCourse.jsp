<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function openAddDlg() {
		$("#myModalLabel").html("添加机构");
		$("#fm").attr("action","AdminOrganization_saveObject.action");
		resetValue();
	}
	function modify(id, name,linkMan, telephone,address, introduction, email) {
	
		var introduction_removeEnter = introduction.replace(/\[enter\]/g,"\n");
		
		$("#fm").attr("action","AdminOrganization_saveOrUpdateObject.action");
		$("#id").val(id);
		$("#name").val(name);
		$("#linkMan").val(linkMan);
	    $("#telephone").val(telephone);
   		$("#address").val(address);
		$("#introduction").val(introduction_removeEnter);
		$("#email").val(email);
		
// 		$("#ImgPr").attr("src", "${pageContext.request.contextPath}/" + logo);
	}

	
	function resetValue() {
		$("#id").val("");
		$("#name").val("");
		$("#introduction").val("");
		$("#address").val("");
		$("#linkMan").val("");
		$("#telephone").val("");
		$("#address").val("");
		$("#email").val("");
	}
	function searchUserByNickName(userNickName) {
		$.post("Section_getUserByNickName.action", {
			nickName : userNickName
		}, function(result) {
			var result = eval('(' + result + ')');
			$("#info").html(result.info);
			$("#masterId").val(result.masterId);
		});
	}
	
	function searchFunc(){
	
		
		var search_content = {
			classNo:"",
			className:""
		};
		
		search_content.classNo = $("#search_classNo").val();
		search_content.className = $("#search_className").val();
		
		$("#searchContent").val(JSON.stringify(search_content));
		
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="TeacherAdminCourse_findPageByMap?mainPage=teacherAdminCourse.jsp&findPageTarget=/admin/TeacherAdminCourse_findPageByMap" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 排班编号： <input id="search_classNo" value="" type="text"
					class="input-medium search-query" placeholder="输入机构名称...">
				&nbsp; 班名： <input id="search_className" value="" type="text"
					class="input-medium search-query" placeholder="输入联系人...">	
				<input id="searchContent" name="searchContent" type="hidden" value="">				
				<button id="search_btn" type="button" class="btn btn-primary" title="Search" onclick="javascript:searchFunc()">
					查询&nbsp;<i class="icon  icon-search"></i>
				</button>
				<br> <br>
			</form>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>授课安排</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check table-hover">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>排班编号</th>
									<th>班名</th>
									<th>课程</th>
									<th>课程封面</th>
									<th>开始时间</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results }" var="classTable" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${classTable.classNo }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${classTable.classNo }</td>
 										<td style="text-align: center;vertical-align: middle;">${classTable.className }</td>
 										<td style="text-align: center;vertical-align: middle;">${classTable.course.name }</td>
										<td
											style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;"
											src='${pageContext.request.contextPath}/${classTable.course.imageUrl }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">
										<fmt:formatDate  value="${classTable.startTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
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
				<h3 id="myModalLabel">机构信息添加或修改</h3>
			</div>
			<div class="modal-body">
				<form id="fm"
					action="AdminOrganization_saveObject.action"
					method="post" enctype="multipart/form-data">
					<table>

						<tr>
							 <input id="id" type="hidden" name="organization.id" value="${organization.id }"/>
							 <input id="currentPage" type="hidden" name="currentPage" value="${page }">
							<td><label class="control-label" for="name">机构名称：</label>
							</td>
							<td><input id="name" type="text"
								name="organization.name" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="linkMan">联系人：</label>
							</td>
							<td><input id="linkMan" type="text"
								name="organization.linkMan" placeholder="请输入…"></td>
						</tr>	
						
						<tr>
							<td><label class="control-label" for="telephone">联系电话：</label>
							</td>
							<td><input id="telephone" type="text"
								name="organization.telephone" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="email">邮箱：</label>
							</td>
							<td><input id="email" type="text"
								name="organization.email" placeholder="请输入…"></td>
						</tr>

						<tr>
							<td><label class="control-label" for="address">地址：</label>
							</td>
							<td><input id="address" type="text"
								name="organization.address" placeholder="请输入…"></td>
						</tr>	

						<tr>
							<td><label class="control-label" for="introduction">机构介绍：</label>
							</td>
							<td>
							<textarea id="introduction" rows="5" cols="50" style="width: 405px;"  name="organization.introduction"></textarea>
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