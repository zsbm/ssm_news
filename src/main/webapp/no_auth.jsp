<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>权限不足页面</title>
</head>
<body>
	<h2>您的权限不足,请联系管理员!</h2>
</body>
</html>