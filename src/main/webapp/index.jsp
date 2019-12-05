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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/public.css">
<script src="js/jquery.min.js"></script>
<title>新闻首页</title>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");

	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			$(".ifame-item-sub").hide();
			if($(this.lastElementChild).css('display') == 'block'){
				$(this.lastElementChild).hide()
				$(".ifame-item-sub li").removeClass("active");
			}else{
				$(this.lastElementChild).show();
				$(".ifame-item-sub li").on('click',function(){
					$(".ifame-item-sub li").removeClass("active");
					$(this).addClass("active");
				});
			}
		});
	}
});
//点击请登录跳到login.jsp
function login(){
	console.log("login...");
	location.href="login.jsp";
}
//点击安全退出按钮
function logout(){
	if ('${USER_IN_SESSION}'!='') {
		result = confirm("确定要退出系统吗?");
		console.log(result);//
		if (result!='0') {
			location.href="login.jsp";
		}
	}
}

</script>
</head>
<body>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href="index.jsp"><i>LOGO</i>
			<h3>aowin</h3></a></div>
			<div class="public-header-admin fr">
				<c:if test="${empty USER_IN_SESSION }">
					<p class="admin-name">
						<span onclick="login()">未登录,点此登录</span>
					</p>
				</c:if>
			
				<c:if test="${not empty USER_IN_SESSION }">
					<p class="admin-name">${USER_IN_SESSION.username } 您好！</p>
				</c:if>
				
				<div class="public-header-fun fr">
					<a href="index.jsp" class="public-header-man">管理</a>
				<c:if test="${empty USER_IN_SESSION }">
					<a href="javascript:;" onclick="login()" class="public-header-loginout">登录</a>	

				</c:if>
				<c:if test="${not empty USER_IN_SESSION }">
					<a href="javascript:;" onclick="logout()" class="public-header-loginout">安全退出</a>	
				</c:if>				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">
	<!-- 内容模块头 -->
		
		<div class="clearfix"></div>
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="index.jsp">首页</a>
				</div>
			</div>
			<ul class="left-nav-list">
				<li class="public-ifame-item">
					<a href="javascript:;">系统管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li class="active"><a href="user/addUser.jsp" target="content">用户增加</a></li>
							<li><a href="user/userManager" target="content">用户管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">新闻管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li>
								<a href="news/addNews.jsp" target="content">新闻添加</a>
								<!-- |<a href="信息管理/article_add.html" target="content">添加</a> -->
							</li>
							<li><a href="news/newsManager" target="content">新闻管理</a></li>
                            <li><a href="news/newsQuery.jsp" target="content">新闻查询</a></li>
						</ul>
					</div>
				</li>
				
				
			</ul>
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		<iframe name="content" src="main.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
		</div>
	</div>
</div>

</body>
</html>