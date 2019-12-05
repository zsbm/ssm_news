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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录页面</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">新闻管理系统</div>
        <div class="login_form">
			<form id="loginForm" name="Login" method="post" onsubmit="" action="login">
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" name="account" class="login_input">
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" name="password" class="login_input">
				</li>
				<li class="login-item verify">
					<span>验证码：</span>
					<input type="text" name="checkCode" class="login_input verify_input">
				</li>
				<img src="images/verify.PNG" border="0" class="verifyimg" />
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>                      
           </form>
		</div>
	</div>
</div>
<!-- 登录失败弹出提示信息  -->
<script>
	if('${errorMsg}'!=''){
		console.log("errorMsg");//
		alert('${errorMsg}');
	}
</script>	
</body>
</html>