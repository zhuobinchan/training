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
	function saveBroadcast() {
		
		if ($("#name").val() == null
				|| $("#name").val() == '') {
			$("#error").html("请输入机构名称！");
			$("#name").focus();
			return false;
		}
		if ($("#linkMan").val() == null || $("#linkMan").val() == '') {
			$("#error").html("请输入联系人！");
			$("#linkMan").focus();
			return false; 
		}
		if ($("#telephone").val() == null || $("#telephone").val() == '') {
			$("#error").html("请输入联系电话！");
			$("#telephone").focus();
			return false;
		}
		if ($("#email").val() == null || $("#email").val() == '') {
			$("#error").html("请输入邮箱！");
			$("#email").focus();
			return false;
		}
		if ($("#address").val() == null || $("#address").val() == '') {
			$("#error").html("请输入邮箱！");
			$("#address").focus();
			return false;
		}		
		if ($("#introduction").val() == null || $("#introduction").val() == '') {
			$("#error").html("请输入机构介绍！");
			$("#introduction").focus();
			return false;
		}
		/* $.post("Section_save.action", $("#fm").serialize()); */
		$("#fm").submit();
		alert("保存成功！");
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
	function deleteObj(objId) {
		if (confirm("确定要删除这条数据吗?")) {
			$.post("AdminOrganization_deleteObject.action?mainPage=adminOrganization.jsp", {
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
			$.post("AdminOrganization_deleteObjects.action?mainPage=adminOrganization.jsp", {
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
			name:"",
			linkMan:""
		};
		
		search_content.name = $("#search_name").val();
		search_content.linkMan = $("#search_linkMan").val();
		
		$("#searchContent").val(JSON.stringify(search_content));
		
		$("#search_fm").submit();
		
		
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">

			<form id="search_fm" action="AdminOrganization_findPageByMap?mainPage=adminOrganization.jsp&findPageTarget=/admin/AdminOrganization_findPageByMap" method="post"
				class="form-search" style="display: inline;">
				&nbsp; 机构名称： <input id="search_name" name="organization.name" value="" type="text"
					class="input-medium search-query" placeholder="输入机构名称...">
				&nbsp; 联系人： <input id="search_linkMan" name="organization.linkMan" value="" type="text"
					class="input-medium search-query" placeholder="输入联系人...">	
				<input id="searchContent" name="searchContent" type="hidden" value="">				
				<button id="search_btn" type="button" class="btn btn-primary" title="Search" onclick="javascript:searchFunc()">
					查询&nbsp;<i class="icon  icon-search"></i>
				</button>
				<br> <br>
				<button class="btn btn-primary" type="button" data-backdrop="static"
					data-toggle="modal" data-target="#dlg"
					onclick="return openAddDlg()">添加机构</button>
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
									<th>机构名称</th>
									<th>联系人</th>
									<th>联系电话</th>
									<th>地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${results }" var="organization" varStatus="idx">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;"  myids="${organization.id }">${(page-1)*6+idx.index+1 }</td>
										<td style="text-align: center;vertical-align: middle;">${organization.name }</td>
										<td style="text-align: center;vertical-align: middle;">${organization.linkMan }</td>
										<td style="text-align: center;vertical-align: middle;">${organization.telephone }</td>
										<td style="text-align: center;vertical-align: middle;">${organization.address }</td>
										
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button"
												data-backdrop="static" data-toggle="modal"
												data-target="#dlg"
												<%
												    request.setAttribute("vEnter", "\r\n");   
												    request.setAttribute("nEnter", "[enter]");
												%> 
												onclick="return modify('${organization.id }','${organization.name }','${organization.linkMan}','${organization.telephone }','${organization.address }','${fn:replace(organization.introduction, vEnter, nEnter) }','${organization.email }')">修改
											</button>&nbsp;&nbsp;
											<button class="btn btn-danger" type="button"
												onclick="javascript:deleteObj('${organization.id }')">删除</button>
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