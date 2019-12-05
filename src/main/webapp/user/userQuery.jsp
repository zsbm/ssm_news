<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();//得到工程发布路径 /jsp_path
	// http://localhost:8080/jsp_path/
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"><!--在此页面上所有得到的相对路径都是基于basePath来设置的-->
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/content.css" />
<script src="js/jquery.min.js"></script>
<title>用户查询页面</title>
<script>
	$(function(){
		console.log("loaded...");
		if('${userQueryObject}'!=''){
			var optionArr = $("#authSelect option");
			//console.log('${userQueryObject.auth}');//2
			optionArr.each(function(){
				//console.log($(this).attr("value").trim());//0-1-2
				if($(this).attr("value").trim()=='${userQueryObject.auth}'.trim()){
					console.log("222...");
					$(this).attr("selected","selected");
				}
			});
			$("#userInfoDiv").show();
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
			location.href="user/queryAdvUser?currentPage="+pageNo;
		}
	}
</script>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>><a href="user/userQuery.jsp">用户查询</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>用户查询</h3>
			</div>
			<div class="public-content-cont">
				<form id="queryAdvUserForm" action="user/queryAdvUser" method="POST">
					<div class="form-group_query">
						<label for="">用户编号</label>
						<input class="form-input-txt-userQuery" type="text" name="id" value="${userQueryObject.id }" />
						<label for="">用户账号</label>
						<input class="form-input-txt-userQuery" type="text" name="account" value="${userQueryObject.account }" />
						<label for="">用户名称</label>
						<input class="form-input-txt-userQuery" type="text" name="username" value="${userQueryObject.username }" />
						<label for="">用户权限</label>
						<select id="authSelect" class="form-input-txt-userQuery" name="auth">
		                   	<option value="" ></option>
		                   	<option value="/*" >管理员</option>
		                   	<option value="/news" >新闻管理</option>
		                   	<option value="/user" >用户管理</option>
	                    </select>
	                    <!-- <input type="button" onclick="queryAdvByCondition()" class="sub-btn" value="查询" /> -->
	                    <input type="submit" class="sub-btn" value="查询" />
					</div>
				</form>		
			</div>
			<div id="userInfoDiv" class="public-content-cont" style="display: none;">
				<table id="queryUserTable" class="public-cont-table">
					<tr>
						<th style="width: 25%">用户编号</th>
						<th style="width: 25%">用户账号</th>
						<th style="width: 25%">用户名称</th>
						<th style="width: 25%">用户权限</th>
					</tr>

					<%-- <c:forEach items="${userList }" var="item">
						<tr>
							<td>${item.id }</td>
							<td>${item.account }</td>
							<td>${item.username }</td>
							<td>
								<c:choose>
									<c:when test="${item.auth=='/*' }">管理员</c:when>
									<c:when test="${item.auth=='/news' }">新闻管理</c:when>
									<c:when test="${item.auth=='/user' }">用户管理</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach> --%>
					<c:forEach items="${pageResult.dataList }" var="item">
						<tr>
							<td>${item.id }</td>
							<td>${item.account }</td>
							<td>${item.username }</td>
							<td>
								<c:choose>
									<c:when test="${item.auth=='/*' }">管理员</c:when>
									<c:when test="${item.auth=='/news' }">新闻管理</c:when>
									<c:when test="${item.auth=='/user' }">用户管理</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="page">
					<form action="" method="get">
						共<span>${pageResult.totalCount }</span>条记录
						 <a href="javascript:location.href='user/queryAdvUser?currentPage=1'">首页</a>
						 <c:if test="${pageResult.currentPage!=1}">
							 <a href="javascript:location.href='user/queryAdvUser?currentPage=${pageResult.currentPage-1}'">上一页</a> 
						 </c:if>
						 <c:if test="${pageResult.currentPage!=pageResult.totalPage}">
							 <a href="javascript:location.href='user/queryAdvUser?currentPage=${pageResult.currentPage+1}'">下一页</a> 
						 </c:if>
						 第<span style="color: red; font-weight: 600">${pageResult.currentPage}</span>页
						共<span style="color: red; font-weight: 600">${pageResult.totalPage }</span>页 
						<input type="text" class="page-input" value="${pageResult.currentPage}"> 
						<input type="button" class="page-btn" value="跳转" onclick="jumpToPageNo(this)">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>