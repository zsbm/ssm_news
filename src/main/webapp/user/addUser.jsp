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
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/content.css" />
<script src="js/jquery.min.js"></script>
<title>用户添加页面</title>
<script type="text/javascript">
	//输完用户编号后立刻发ajax请求查库id是否重复.若是则提示:用户编号已存在,请重新输入...+将submitFlag变量设为false(点提交按钮则无法提交表单)
	var submitFlag=true;
	function verifyId(){
		console.log("verifyId()");
		var id = $("[name=id]").val();
		console.log(id);//1001
		$.ajax({
			url:"user/verifyId",
			data:{"id":id},
			dataType:"text",
			success:function(data){
				console.log(data);//1
				//console.log(data==1);//true
				console.log(data==2);//true
				if(data==1){
					//id已存在---若不存在则正常输入无提示
					submitFlag=false;
					alert("用户编号已存在,请重新输入...");
				}else if(data==2){
					submitFlag=false;
					alert("用户编号必填...");
				}else {
					submitFlag=true;
				}
			}
		});
	}
	//点提交按钮发ajax请求后台返回添加成败的消息
	function addUser(){
		console.log("addUser()...");
		//表单提交前校验用户编号id是否在库中已重复
		if (submitFlag) {
			$.ajax({
				url:"user/addUser",
				type:'POST',
				dataType:'text',
				data:$("#addUserForm").serialize(),
				success:function(data){
					console.log(data);//1
					if(data==false){
						alert("用户编号已存在,请重新输入...");
					}else if(data==1){
						alert("添加用户成功.");
					}else if(data==0){
						alert("添加用户失败...");
					}
					
				}
			});
		}else{
			alert("请填入合法的用户编号!");
		}
	}
</script>
<!-- <script src="../kingediter/kindeditor-all-min.js"></script>
<script>
	 KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id');
        });
</script> -->
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>><a href="user/addUser.jsp">用户添加</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>用户添加</h3>
			</div>
			<div class="public-content-cont">
			<form id="addUserForm" action="user/addUser" method="POST">
				<div class="form-group">
					<label for="">用户编号</label>
					<input class="form-input-txt" type="text" name="id" value="" onblur="verifyId()"/>
				</div>
				<div class="form-group">
					<label for="">用户账号</label><input class="form-input-txt" type="text" name="account" value="" />
				</div>
				<div class="form-group">
					<label for="">用户密码</label><input class="form-input-txt" type="text" name="password" value="" />
				</div>
				<div class="form-group">
					<label for="">用户名称</label><input class="form-input-txt" type="text" name="username" value="" />
				</div>
				<div class="form-group">
					<label for="">用户权限</label>
                   <select class="form-input-txt" name="auth">
                   	<option value="/*" >管理员</option>
                   	<option value="/news" >新闻管理</option>
                   	<option value="/user" >用户管理</option>
                   </select>
				</div>
				<div class="form-group" style="margin-left:150px;">
					<input type="button" onclick="addUser()" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
			</form>	
			</div>
		</div>
	</div>
</body>
</html>