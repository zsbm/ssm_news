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
<title>新闻详情页面</title>
<style>
	.a_line{
		text-decoration:underline;
		color: blue;
	}
</style>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>>
			<a href="javascript:;">新闻详情</a>
		</div>
		<div id="managerDiv" class="public-content" style="display: block">
			<div class="public-content-header">
				<h3>新闻详情</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width: 10%">新闻编号</th>
						<th style="width: 20%">新闻标题</th>
						<th style="width: 20%">新闻简述</th>
						<th style="width: 20%">添加时间</th>
						<th style="width: 10%">添加用户</th>
						<th style="width: 20%">新闻类别</th>
					</tr>

					<%-- <c:forEach items="${pageResult.dataList }" var="newsDTO"> --%>
						<tr>
							<td>${newsDTO.id }</td>
							<td>${newsDTO.title }</td>
							<td>${newsDTO.content }</td>
							<td>${newsDTO.createDate }</td>
							<td>${newsDTO.username }</td>
							<td>
								<c:choose>
									<c:when test="${newsDTO.type==0 }">娱乐</c:when>
									<c:when test="${newsDTO.type==1 }">国际</c:when>
									<c:when test="${newsDTO.type==2 }">体育</c:when>
								</c:choose>
							</td>
						</tr>
					<%-- </c:forEach> --%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>