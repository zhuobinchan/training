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
		var v =  $(".filter-option").text();
		$("#lablename").attr("value",v);
		
		if ($("#accountNum").val() == null
				|| $("#accountNum").val() == '') {
			$("#error").html("请输入登录账号！");
			$("#accountNum").focus();
			return false;
		}
		if ($("#password").val() == null
				|| $("#password").val() == '') {
			$("#error").html("请输入登录密码！");
			$("#password").focus();
			return false;
		}
		if ($("#tno").val() == null
				|| $("#tno").val() == '') {
			$("#error").html("请输入教师编号！");
			$("#tno").focus();
			return false;
		}		
		if ($("#name").val() == null
				|| $("#name").val() == '') {
			$("#error").html("请输入教师名称！");
			$("#name").focus();
			return false;
		}		
		if ($("#telephone").val() == null
				|| $("#telephone").val() == '') {
			$("#error").html("请输入联系电话！");
			$("#telephone").focus();
			return false;
		}		
		if ($("#idCard").val() == null
				|| $("#idCard").val() == '') {
			$("#error").html("请输入身份证！");
			$("#idCard").focus();
			return false;
		}		
		if ($("#gender").val() == null
				|| $("#gender").val() == '') {
			$("#error").html("请选择性别！");
			$("#gender").focus();
			return false;
		}	
		if ($("#organizationId").val() == null
				|| $("#organizationId").val() == '') {
			$("#error").html("请选择所属机构！");
			$("#organizationId").focus();
			return false;
		}		
		
				
		/* $.post("Section_save.action", $("#fm").serialize()); */
		$("#fm").submit();
		alert("保存成功！");
	}
	
	function modify(pid,accountNum, password, tno,
			name, telephone, idCard, gender, address,email,organizationId,headUrl,introduction) {

		var introduction_removeEnter = introduction.replace(/\[enter\]/g,"\n");
		
		$("#fm").attr("action","AdminTeacher_saveOrUpdateObject.action");
		$("#teacherId").val(pid);
		$("#accountNum").val(accountNum);
		$("#password").val(password);
	    $("#tno").val(tno);
   		$("#name").val(name);
		$("#introduction").val(introduction_removeEnter);
		$("#telephone").val(telephone);
		$("#idCard").val(idCard);
		$("#gender").val(gender);
		$("#address").val(address);
		$("#email").val(email);
		$("#organizationId").val(organizationId);
		 $("#ImgPr").attr("src", "${pageContext.request.contextPath}/" + headUrl);
	}
	function deleteObj(objId) {
		if (confirm("确定要删除这条数据吗?")) {
			$.post("AdminTeacher_deleteObject.action?mainPage=adminOrganization.jsp", {
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
			$.post("AdminTeacher_deleteObjects.action?mainPage=adminOrganization.jsp", {
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
		$("#accountNum").val("");
		$("#password").val("");
		$("#telephone").val("");
		$("#idCard").val("");
		$("#gender").val("");
		$("#address").val("");
		$("#email").val("");
		$("#name").val("");
		$("#headUrl").val("");
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
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="AdminTeacher_findPageByMap?mainPage=adminTeacher.jsp&findPageTarget=/admin/AdminTeacher_findPageByMap" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 教师姓名： <input id="search_name" name="teacher.name" value="" type="text"
					class="input-medium search-query" placeholder="输入直教师名称...">
				&nbsp; 联系电话： <input id="search_telphone" name="teacher.name" value="" type="text"
					class="input-medium search-query" placeholder="输入联系电话...">					
				&nbsp; 所属机构： <select id="search_organization"
					name="organization.id"><option value="">请选择...</option>
					<c:forEach var="organization" items="${organizations }">
						<option value="${organization.id }">${organization.name }</option>
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
						<h5>教师管理</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>教师编号</th>
									<th>教师姓名</th>
									<th>教师头像</th>
									<th>教师联系电话</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results}" var="teacher" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${teacher.pid }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${teacher.tno }</td>

										<td style="text-align: center;vertical-align: middle;">${teacher.name }</td>
										<td
											style="text-align: center;vertical-align: middle;width: 110px;vertical-align: middle;">
											<img style="width: 100px;"
											src='${pageContext.request.contextPath}/${teacher.headUrl }'></img>
										</td>
										<td style="text-align: center;vertical-align: middle;">${teacher.telephone }</td>
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												<%
												    request.setAttribute("vEnter", "\r\n");   
												    request.setAttribute("nEnter", "[enter]");
												%> 
												onclick="return modify('${teacher.pid }','${teacher.accountNum }','${teacher.password }','${teacher.tno }','${teacher.name }','${teacher.telephone }','${teacher.idCard }','${teacher.gender }','${teacher.address }','${teacher.email }','${teacher.organization.id }','${teacher.headUrl }','${fn:replace(teacher.introduction, vEnter, nEnter) }')">修改
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
				<h3 id="myModalLabel">教师信息添加或修改</h3>
			</div>
			<div class="modal-body">
				<form id="fm"
					action="AdminTeacher_saveObject.action"
					method="post" enctype="multipart/form-data">
					<table>

						<tr>
							 <input id="teacherId" type="hidden" name="teacher.pid">
							 <input id="currentPage" type="hidden" name="currentPage" value="${page }">
							<td><label class="control-label" for="accountNum">登录账号：</label>
							</td>
							<td><input id="accountNum" type="text"
								name="teacher.accountNum" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="password">密码：</label>
							</td>
							<td><input id="password" type="password"
								name="teacher.password" placeholder="请输入…"></td>
						</tr>	
						
						<tr>
							<td><label class="control-label" for="tno">教师编号：</label>
							</td>
							<td><input id="tno" type="text"
								name="teacher.tno" placeholder="请输入…"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="name">教师姓名：</label>
							</td>
							<td><input id="name" type="text"
								name="teacher.name" placeholder="请输入…"></td>
						</tr>

						<tr>
							<td><label class="control-label" for="telephone">联系电话：</label>
							</td>
							<td><input id="telephone" type="text"
								name="teacher.telephone" placeholder="请输入…"></td>
						</tr>					

						<tr>
							<td><label class="control-label" for="idCard">身份证：</label>
							</td>
							<td><input id="idCard" type="text"
								name="teacher.idCard" placeholder="请输入…"></td>
						</tr>	
 
						<tr>
							<td><label class="control-label" for="gender">性别：</label>
							</td>
							<td><select id="gender"
								name="teacher.gender">
								    <option value="">请选择...</option>
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
							<td><label class="control-label" for="email">邮箱：</label>
							</td>
							<td><input id="email" type="text"
								name="teacher.email" placeholder="请输入…"></td>
						</tr>
						

						<tr>
							<td><label class="control-label" for="organizationId">所属机构：</label>
							</td>
							<td><select id="organizationId"
								name="teacher.organization.id"><option value="">请选择...</option>
									<c:forEach var="organization" items="${organizations }">
										<option value="${organization.id }">${organization.name }</option>
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
							<td><label class="control-label" for="introduction">教师简介：</label>
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