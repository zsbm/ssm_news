<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();//得到工程发布路径 /jsp_path
	// http://localhost:8080/jsp_path/
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<!--在此页面上所有得到的相对路径都是基于basePath来设置的-->
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/content.css" />
<script src="js/jquery.min.js"></script>
<title>用户管理页面</title>
<style>
	.a_line{
		text-decoration:underline;
		color: blue;
	}
</style>
<script type="text/javascript">
	//点删除:获取到id发ajax删库记录+页面删除tr
	function deleteUser(obj) {
		console.log("deleteUser()...");
		//询问是否确定删除
		var result = window.confirm("确定删除吗?");//true/false
		if (result) {
			//在删除前要先判断管理员当前删除的用户的编号是否等于当前登录用户的编号,若等则表示删自己(不允许删登录用户自己),提示:不能删除当前登录用户
			var id = $(obj).parents("tr").children("td:eq(0)").text().trim();
			console.log(id);//
			console.log(id=='${USER_IN_SESSION.id}');//
			if (id=='${USER_IN_SESSION.id}') {
				alert("不能删除当前用户");
				return;
			}
			//$(obj).parents("tr").remove();
			$.ajax({
				url : "user/deleteUser",
				dataType : "text",
				data : {
					"id" : id
				},
				success : function(data) {
					console.log(data);//
					if (data == 1) {
						alert("删除成功...");
						//$(obj).parents("tr").remove();
						location.href="user/userManager";
					} else {
						alert("不能删除账户下有新闻的用户...");
					}
				}
			});
		}
	}
	//点修改链接:显示updateDiv+隐藏managerDiv+获取一行数据并回显
	function updateUser(obj) {
		var id = $(obj).parents("tr").children("td:eq(0)").text().trim();
		console.log(id);//
		console.log(id=='${USER_IN_SESSION.id}');//
		if (id=='${USER_IN_SESSION.id}') {
			alert("不能修改当前用户");
			return;
		}
		console.log("updateUser()...");
		var id = $(obj).parents("tr").children("td:eq(0)").text();
		var account = $(obj).parents("tr").children("td:eq(1)").text();
		var username = $(obj).parents("tr").children("td:eq(2)").text();
		var auth = $(obj).parents("tr").children("td:eq(3)").text();
		var optionArr = $("[name=auth]").children("option");
		optionArr.each(function(){
			//console.log($(this).attr("value").trim()+"999");
			//console.log($(this).attr("value").trim()==type);//true
			if ($(this).attr("value").trim()==auth) {
				$(this).attr("selected","selected");
			}
		});
		$("[name=id]").val(id);
		$("[name=account]").val(account);
		$("[name=username]").val(username);
		$("[type=hidden]").val(id);
		$("#updateDiv").show();
		$("#managerDiv").hide();
	}
	//点修改提交按钮
	function updateSubmit(){
		$("#updateUserForm").submit();
		$("#updateDiv").hide();
		$("#managerDiv").show();
	}
	$(function(){
		if ('${message}'!='') {
			alert('${message}');
		}
	});
	//点击跳转按钮
	function jumpToPageNo(obj){
		console.log("jumpToPageNo()...");
		var pageNo = $(obj).prev().val();
		console.log(pageNo);//2
		console.log(/^[1-9][0-9]*$/.test(pageNo));//
		if (!(/^[1-9][0-9]*$/.test(pageNo))) {
			alert("请输入非0开头的数字...");
		}else if (pageNo>parseInt('${pageResult.totalPage}')) {
			alert("此页码不存在...");
		}else{
			location.href="user/userManager?currentPage="+pageNo;
		}
	}
</script>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>><a
				href="user/userManager">用户管理</a>
		</div>
		<div id="managerDiv" class="public-content" style="display: block">
			<div class="public-content-header">
				<h3>用户管理</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width: 20%">用户编号</th>
						<th style="width: 20%">用户账号</th>
						<th style="width: 20%">用户名称</th>
						<th style="width: 20%">用户权限</th>
						<th style="width: 20%">操作</th>
					</tr>

					<c:forEach items="${pageResult.dataList }" var="userDTO">
						<tr>
							<td>${userDTO.id }</td>
							<td>${userDTO.account }</td>
							<td>${userDTO.username }</td>
							<td>
								<c:choose>
									<c:when test="${userDTO.auth=='/*' }">管理员</c:when>
									<c:when test="${userDTO.auth=='/news' }">新闻管理</c:when>
									<c:when test="${userDTO.auth=='/user' }">用户管理</c:when>
								</c:choose>
								
							</td>
							<td>
								<div class="table-fun">
									<a href="javascript:;" onclick="updateUser(this)">修改</a> <a
										href="javascript:;" onclick="deleteUser(this)">删除</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="page">
					<form action="" method="get">
						共<span>${pageResult.totalCount }</span>条记录
						 <a href="javascript:location.href='user/userManager?currentPage=1'">首页</a>
						 <c:if test="${pageResult.currentPage!=1}">
							 <a href="javascript:location.href='user/userManager?currentPage=${pageResult.currentPage-1}'">上一页</a> 
						 </c:if>
						 <c:if test="${pageResult.currentPage!=pageResult.totalPage}">
							 <a href="javascript:location.href='user/userManager?currentPage=${pageResult.currentPage+1}'">下一页</a> 
						 </c:if>
						 第<span style="color: red; font-weight: 600">${pageResult.currentPage}</span>页
						共<span style="color: red; font-weight: 600">${pageResult.totalPage }</span>页 
						<input type="text" class="page-input" value="${pageResult.currentPage}"> 
						<input type="button" class="page-btn" value="跳转" onclick="jumpToPageNo(this)">
					</form>
				</div>
			</div>
		</div>
		<!-- 修改页面:回显数据 -->
		<div id="updateDiv" class="public-content" style="display: none;">
			<div class="public-content-header">
				<h3>用户修改</h3>
			</div>
			<div class="public-content-cont">
				<form id="updateUserForm" action="user/updateUser" method="POST">
					<input type="hidden" name="id" value="">
					<div class="form-group">
						<label for="">用户编号</label> <input class="form-input-txt"
							type="text" name="id" value="" disabled="disabled" />
					</div>
					<div class="form-group">
						用户账号 <input class="form-input-txt" type="text" name="account"
							value="" />
					</div>
					<div class="form-group">
						用户名称 <input class="form-input-txt" type="text" name="username"
							value="" />
					</div>
					<div class="form-group">
						<label for="">用户权限</label>
						<select class="form-input-txt" name="auth">
                   			<option value="/*" >管理员</option>
                   			<option value="/news" >新闻管理</option>
                   			<option value="/user" >用户管理</option>
                   		</select> 
					</div>
					<div class="form-group" style="margin-left: 150px;">
						<!-- <input type="submit" class="sub-btn" value="提  交" /> -->
						<input type="button" class="sub-btn" onclick="updateSubmit()"
							value="提  交" /> <input type="reset" class="sub-btn" value="重  置" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>