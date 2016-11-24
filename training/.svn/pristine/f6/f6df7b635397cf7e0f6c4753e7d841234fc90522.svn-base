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
		$("#myModalLabel").html("添加学生");
		$("#fm").attr("action","AdminStudent_saveObject.action");
		resetValue();
	}
	function saveBroadcast() {
		
		if ($("#name").val() == null
				|| $("#name").val() == '') {
			$("#error").html("请输入学生姓名名称！");
			$("#name").focus();
			return false;
		}
		
		/* $.post("Section_save.action", $("#fm").serialize()); */
		$("#fm").submit();
		alert("保存成功！");
	}
	
	function deleteObj(objId) {
		if (confirm("确定要删除这条数据吗?")) {
			$.post("AdminStudent_deleteObject.action?mainPage=adminStudent.jsp", {
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
			$.post("AdminStudent_deleteObjects.action?mainPage=adminStudent.jsp", {
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
	
	function modify(accountNum,  sno, school, unit, integral,
			name, telephone, idCard, gender, address,email,headUrl) {

		
		$("#accountNum").val(accountNum);
	    $("#sno").val(sno);
	    $("#school").val(school);
	    $("#unit").val(unit);
   		$("#name").val(name);
   		$("#integral").val(integral);
		$("#telephone").val(telephone);
		$("#idCard").val(idCard);
		$("#gender").val(gender);
		$("#address").val(address);
		$("#email").val(email);
		 $("#ImgPr").attr("src",headUrl);
	}

	function searchFunc(){
	
		
		var search_content = {
			sno:"",
			name:""
		};
		
		search_content.sno = $("#search_sno").val();
		search_content.name = $("#search_name").val();
		
		$("#searchContent").val(JSON.stringify(search_content));
		
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="AdminStudent_findPageByMap?mainPage=adminStudent.jsp&findPageTarget=/admin/AdminStudent_findPageByMap" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 学号： <input id="search_sno" name="student.sno" value="" type="text"
					class="input-medium search-query" placeholder="输入学号...">
				&nbsp; 学生姓名： <input id="search_name" name="student.name" value="" type="text"
					class="input-medium search-query" placeholder="输入学生姓名...">	
				<input id="searchContent" name="searchContent" type="hidden" value="">				
				<button id="search_btn" type="button" class="btn btn-primary" title="Search" onclick="javascript:searchFunc()">
					查询&nbsp;<i class="icon  icon-search"></i>
				</button>
				<br> <br>
				<a href="#" role="button"
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
									<th>登陆账号</th>
									<th>学号</th>
									<th>姓名</th>
									<th>电话</th>
									<th>性别</th>
									<th>邮箱</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results }" var="student" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${student.pid }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${student.sno }</td>
										<td style="text-align: center;vertical-align: middle;">${student.name }</td>
										<td style="text-align: center;vertical-align: middle;">${student.telephone }</td>
										<td style="text-align: center;vertical-align: middle;">${student.email }</td>
										
										<td style="text-align: center;vertical-align: middle;">
										
											<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												onclick="return modify('${student.accountNum }','${student.sno }','${student.school }', '${student.unit }', '${student.integral }','${student.name }', '${student.telephone }', '${student.idCard }','${student.gender }', '${student.address }','${student.email }','${student.headUrl }')">查看
											</button>

											<button class="btn btn-danger" type="button"
												onclick="javascript:deleteObj('${student.pid }')">删除</button>
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
				<h3 id="myModalLabel">查看学生信息</h3>
			</div>
			<div class="modal-body">
				<form id="fm"
					action="#"
					method="post" enctype="multipart/form-data">
					<table>

						<tr>
							<td><label class="control-label" for="accountNum">登录账号：</label>
							</td>
							<td><input id="accountNum" type="text"
								name="student.accountNum" readOnly="true"></td>
						</tr>
						
						
						
						<tr>
							<td><label class="control-label" for="sno">学生编号：</label>
							</td>
							<td><input id="sno" type="text"
								name="student.sno" readOnly="true"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="name">学生姓名：</label>
							</td>
							<td><input id="name" type="text"
								name="student.name" readOnly="true"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="school">所属学校：</label>
							</td>
							<td><input id="school" type="text"
								name="student.school" readOnly="true"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="unit">所属公司：</label>
							</td>
							<td><input id="unit" type="text"
								name="student.unit" readOnly="true"></td>
						</tr>
						
						<tr>
							<td><label class="control-label" for="integral">积分：</label>
							</td>
							<td><input id="integral" type="text"
								name="student.integral" readOnly="true"></td>
						</tr>

						<tr>
							<td><label class="control-label" for="telephone">联系电话：</label>
							</td>
							<td><input id="telephone" type="text"
								name="student.telephone" readOnly="true"></td>
						</tr>					

						<tr>
							<td><label class="control-label" for="idCard">身份证：</label>
							</td>
							<td><input id="idCard" type="text"
								name="student.idCard" readOnly="true"></td>
						</tr>	
 
						<tr>
							<td><label class="control-label" for="gender">性别：</label>
							</td>
							<td><input id="gender" type="text"
								name="student.gender" readOnly="true"></td>
						</tr>

						<tr>
							<td><label class="control-label" for="address">地址：</label>
							</td>
							<td><input id="address" type="text"
								name="student.address" readOnly="true"></td>
						</tr>	

						<tr>
							<td><label class="control-label" for="email">邮箱：</label>
							</td>
							<td><input id="email" type="text"
								name="student.email" readOnly="true"></td>
						</tr>
						
						<tr>
							<td><img id="ImgPr" class="pull-left"
								style="width: 120px; height: 120px;"
								src="${pageContext.request.contextPath}/" /></td>
							<td></td>
						</tr>
						
					</table>
				</form>
			</div>
		</div
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