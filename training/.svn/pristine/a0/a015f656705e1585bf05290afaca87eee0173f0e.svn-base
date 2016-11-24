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
	src="${pageContext.request.contextPath}/admin/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/uploadPreview.min.js"></script>
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
		$("#myModalLabel").html("添加教师");
		$("#fm").attr("action","AdminTeacher_saveObject.action");
		resetValue();
	}
	function saveBroadcast() {
// 		var v =  $(".filter-option").text();
// 		$("#lablename").attr("value",v);
		
// 		if ($("#accountNum").val() == null
// 				|| $("#accountNum").val() == '') {
// 			$("#error").html("请输入登录账号！");
// 			$("#accountNum").focus();
// 			return false;
// 		}
// 		if ($("#password").val() == null
// 				|| $("#password").val() == '') {
// 			$("#error").html("请输入登录密码！");
// 			$("#password").focus();
// 			return false;
// 		}
// 		if ($("#tno").val() == null
// 				|| $("#tno").val() == '') {
// 			$("#error").html("请输入教师编号！");
// 			$("#tno").focus();
// 			return false;
// 		}		
// 		if ($("#name").val() == null
// 				|| $("#name").val() == '') {
// 			$("#error").html("请输入教师名称！");
// 			$("#name").focus();
// 			return false;
// 		}		
// 		if ($("#telephone").val() == null
// 				|| $("#telephone").val() == '') {
// 			$("#error").html("请输入联系电话！");
// 			$("#telephone").focus();
// 			return false;
// 		}		
// 		if ($("#idCard").val() == null
// 				|| $("#idCard").val() == '') {
// 			$("#error").html("请输入身份证！");
// 			$("#idCard").focus();
// 			return false;
// 		}		
// 		if ($("#gender").val() == null
// 				|| $("#gender").val() == '') {
// 			$("#error").html("请选择性别！");
// 			$("#gender").focus();
// 			return false;
// 		}	
// 		if ($("#organizationId").val() == null
// 				|| $("#organizationId").val() == '') {
// 			$("#error").html("请选择所属机构！");
// 			$("#organizationId").focus();
// 			return false;
// 		}		
		
				
		/* $.post("Section_save.action", $("#fm").serialize()); */
		$("#fm").submit();
		alert("保存成功！");
	}
	
	function modify(pid,telephone,nickName, gender, address,email,headUrl,introduction) {

		var introduction_removeEnter = introduction.replace(/\[enter\]/g,"\n");
		
		$("#fm").attr("action","TeacherAdminCourse_modifyTeacher");
		$("#teacherId").val(pid);
		$("#nickName").val(nickName);
		$("#introduction").val(introduction_removeEnter);
		$("#telephone").val(telephone);
		$("#gender").val(gender);
		$("#address").val(address);
		$("#email").val(email);
		$("#ImgPr").attr("src", "${pageContext.request.contextPath}/" + headUrl);
	}

	function resetValue() {
// 		$("#telephone").val("");
// 		$("#idCard").val("");
// 		$("#gender").val("");
// 		$("#address").val("");
// 		$("#email").val("");
// 		$("#name").val("");
// 		$("#headUrl").val("");
	}
	function searchFunc(){
		
// 		var search_content = {
// 			name:"",
// 			telephone:"",
// 			organization.id:""
// 		};
		
		var search_name = $("#search_name").val();
		var search_telphone = $("#search_telphone").val();
		var search_organization = $("#search_organization").val();
		
		var str = "{'name':'"+search_name+"',"
			      +"'telephone':'"+search_telphone+"',"
			      +"'organization.id':'"+search_organization+"'}";
		
// 		$("#searchContent").val(JSON.stringify(search_content));
		$("#searchContent").val(str);
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
<!-- 		<div id="tooBar" style="padding: 10px 0px 0px 10px;"> -->

<!-- 			<form id="search_fm" action="AdminTeacher_findPageByMap?mainPage=adminTeacher.jsp&findPageTarget=/admin/AdminTeacher_findPageByMap" method="post" -->
<!-- 				class="form-search" style="display: inline;"> -->
<!-- 				&nbsp; 教师姓名： <input id="search_name" name="teacher.name" value="" type="text" -->
<!-- 					class="input-medium search-query" placeholder="输入直教师名称..."> -->
<!-- 				&nbsp; 联系电话： <input id="search_telphone" name="teacher.name" value="" type="text" -->
<!-- 					class="input-medium search-query" placeholder="输入联系电话...">					 -->
<!-- 				&nbsp; 所属机构： <select id="search_organization" -->
<!-- 					name="organization.id"><option value="">请选择...</option> -->
<!-- 					<c:forEach var="organization" items="${organizations }"> -->
<!-- 						<option value="${organization.id }">${organization.name }</option> -->
<!-- 					</c:forEach> -->
<!-- 				</select>&nbsp; -->
<!-- 				<input id="searchContent" name="searchContent" type="hidden" value="">	 -->
<!-- 				<button type="button" class="btn btn-primary" title="Search" onclick="searchFunc()"> -->
<!-- 					查询&nbsp;<i class="icon  icon-search"></i> -->
<!-- 				</button> -->
<!-- 				<br> <br> -->
<!-- 			</form> -->
<!-- 		</div> -->
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>${session.teacher.name }：您好，这里可以查看编辑个人信息！</h5>
					</div>
					<div class="widget-content nopadding">

<div class="container-fluid" id="personInfo">
	<div class="row-fluid">
		<div class="span12">
<!-- 			<h3 class="text-info"> -->
<!-- 				${session.teacher.name }：您好，这里可以查看编辑个人信息！ -->
<!-- 			</h3> -->
			<div class="row-fluid">
				<div class="span2">
				</div>
				<div class="span6">
					<div class="row-fluid">
					<div class="span4">
					<img src="${pageContext.request.contextPath}/${result.headUrl}" class="img-rounded" style="width: 160px;height: 160px"/>
					</div>
						<div class="span4">
							<p class="text-left lead text-success">
								<strong>昵称：</strong>${session.teacher.nickName }
							</p>
							<p class="text-success lead">
								<strong>积分：8000</strong>
							</p>
						</div>
						<div class="span4">
							<p class="text-success lead">
								<strong>性别:</strong>${result.gender }
							</p>
										<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												<%
												    request.setAttribute("vEnter", "\r\n");   
												    request.setAttribute("nEnter", "[enter]");
												%> 
												pid,telephone,nickName, gender, address,email,headUrl,introduction
												onclick="return modify('${teacher.pid }','${teacher.telephone }','${teacher.nickName }','${teacher.gender }','${teacher.address }','${teacher.email }','${teacher.headUrl }','${fn:replace(teacher.introduction, vEnter, nEnter) }')">修改
											</button>
						</div>
					</div>
				</div>
				<div class="span4">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2">
				</div>
				<div class="span6">
					<p class="lead">
						<strong>手机号码：</strong>${result.telephone }
					</p>
					<p class="lead">
						<strong>身份证：</strong>${result.idCard }
					</p>
					<p class="lead">
						<strong>邮箱：</strong>${result.email }
					</p>
					<p class="lead">
						<strong>地址：</strong>${result.address }
					</p>
					<p class="text-left lead">
						<strong>个人介绍</strong>：${result.introduction }
					</p>
<!-- 					 <button class="btn btn-warning btn-large" type="button" onclick="return modify()">修改</button> -->

				</div>
				<div class="span4">
				</div>
			</div>
		</div>
	</div>
</div>



			</div>
		</div>
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改个人信息</h3>
			</div>
			<div class="modal-body">
				<form id="fm"
					action="TeacherAdminCourse_modifyTeacher"
					method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td><label class="control-label" for="headUrl" >头像：</label></td>
							<td>
								<img onclick="imgFile()" id="ImgPr" src="img/a.jpg" class="img-polaroid" style="width: 120px;height: 120px;"/>
								<h1 style="display: none"><input type="file" id="headUrl" name="img"/></h1>
							</td>
						</tr>
						<script>
							function imgFile(){
									$("#headUrl").click();
							}
						</script>
						<tr>
							 <input id="teacherId" type="hidden" name="teacher.pid">
							<td><label class="control-label" for="nickName">昵称：</label>
							</td>
							<td><input id="nickName" type="text"
								name="teacher.nickName" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="email">邮箱：</label>
							</td>
							<td><input id="email" type="text"
								name="teacher.email" placeholder="请输入…"></td>
						</tr>
						

						<tr>
							<td><label class="control-label" for="telephone">联系电话：</label>
							</td>
							<td><input id="telephone" type="text"
								name="teacher.telephone" placeholder="请输入…"></td>
						</tr>					

						<tr>
							<td><label class="control-label" for="gender">性别：</label>
							</td>
							<td><select id="gender"
								name="teacher.gender">
									<option value="男">男</option>
									<option value="女">女</option>
							</select></td>
						</tr>

						<tr>
							<td><label class="control-label" for="address">地址：</label>
							</td>
							<td><input id="address" type="text"
								name="teacher.address" placeholder="请输入…"></td>
						</tr>	
						
						<tr>
							<td><label class="control-label" for="introduction">个人介绍：</label>
							</td>
							<td>
							<textarea id="introduction" rows="5" cols="50" style="width: 300px;"  name="teacher.introduction"></textarea>
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