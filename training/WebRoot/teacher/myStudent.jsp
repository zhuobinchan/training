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
	function openAddDlg() {
		$("#myModalLabel").html("添加机构");
		$("#fm").attr("action","AdminOrganization_saveObject.action");
		resetValue();
	}
	function modify(name,nickName,telephone, school, email,headUrl) {
	
		$("#name").append(name);
		$("#nickName").append(nickName);
	    $("#telephone").append(telephone);
   		$("#school").append(school);
		$("#email").append(email);
		
		$("#ImgPr").attr("src", "${pageContext.request.contextPath}/" + headUrl);
	}

	
	function resetValue() {
		$("#name").html("学生姓名：");
		$("#nickName").html("学生昵称：");
		$("#telephone").html("学        校：");
		$("#school").html("联系电话：");
		$("#email").html("邮箱地址：");
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
			name:"",
			telephone:""
		};
		
		search_content.name = $("#search_name").val();
		search_content.telephone = $("#search_telephone").val();
		
		$("#searchContent").val(JSON.stringify(search_content));
		
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="TeacherAdminCourse_filterStudent?findPageTarget=/teacher/TeacherAdminCourse_filterStudent" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 学生姓名： <input id="search_name" value="" type="text"
					class="input-medium search-query" placeholder="输入学生姓名...">
				&nbsp; 联系电话： <input id="search_telephone" value="" type="text"
					class="input-medium search-query" placeholder="输入电话号码...">	
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
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check table-hover">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>学生姓名</th>
									<th>联系手机</th>
									<th>联系邮箱</th>
									<th>学生头像</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results }" var="student" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${student.pid }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${student.name }</td>
 										<td style="text-align: center;vertical-align: middle;">${student.telephone }</td>
										<td style="text-align: center;vertical-align: middle;">${student.email }</td>
										<td
											style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;"
											src='${pageContext.request.contextPath}/${student.headUrl }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												<%
												    request.setAttribute("vEnter", "\r\n");   
												    request.setAttribute("nEnter", "[enter]");
												%> 
												onclick="return modify('${student.name }','${student.nickName }','${student.telephone }','${student.school }','${student.email }','${student.headUrl }')">查看更多
											</button>&nbsp;&nbsp;
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
				<h3 id="myModalLabel">学生个人信息</h3>
			</div>
			<div class="modal-body">
					<table style="float: left">

						<tr>
							 <input id="id" type="hidden" name="organization.id" value="${organization.id }"/>
							 <input id="currentPage" type="hidden" name="currentPage" value="${page }">
							<td><label class="control-label" for="name" id="name">学生姓名：</label>
							</td>
						</tr>
						<tr>
							 <input id="id" type="hidden" name="organization.id" value="${organization.id }"/>
							 <input id="currentPage" type="hidden" name="currentPage" value="${page }">
							<td><label class="control-label" for="name" id="nickName">学生昵称：</label>
							</td>
						</tr>	
						<tr>
							<td><label class="control-label" for="email" id="school">学校：</label>
							</td>
						</tr>											
						<tr>
							<td><label class="control-label" for="telephone" id="telephone">联系电话：</label>
							</td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="email" id="email">邮箱：</label>
							</td>
						</tr>


					</table>
					<img onclick="imgFile()" id="ImgPr"  class="img-polaroid" style="width: 120px;height: 120px;margin-left: 150px"/>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
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