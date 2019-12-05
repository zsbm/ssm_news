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
<title>新闻管理页面</title>
<style>
	.a_line{
		text-decoration:underline;
		color: blue;
	}
</style>
<script type="text/javascript">
	//点删除:获取到id发ajax删库记录+页面删除tr
	function deleteNews(obj) {
		console.log("deleteNews()...");
		//询问是否确定删除
		var result = window.confirm("确定删除吗?");//true/false
		if (result) {
			var id = $(obj).parents("tr").children("td:eq(0)").text();
			console.log(id);//
			//$(obj).parents("tr").remove();
			$.ajax({
				url : "news/deleteNews",
				dataType : "text",
				data : {
					"id" : id
				},
				success : function(data) {
					console.log(data);//
					if (data == 1) {
						alert("删除成功...");
						location.href="news/newsManager";
					} else {
						alert("删除失败...");
					}
				}
			});
		}
	}
	//点修改链接:显示updateDiv+隐藏managerDiv+获取一行数据并回显
	function updateNews(obj) {
		console.log("updateNews()...");
		var id = $(obj).parents("tr").children("td:eq(0)").text();
		var title = $(obj).parents("tr").children("td:eq(1)").text();
		var content = $(obj).parents("tr").children("td:eq(2)").text();
		var type;//用id发ajax查出type
		//console.log(id+title+content);//
		$.ajax({
			url:"news/queryType",
			dataType:"text",
			data:{"id":id},
			async:false,
			success:function(data){
				//console.log(data);//1  娱乐0、国际1、体育2
				type=data.trim();//用ajax从后台接收text类型的值最好用trim()后再比较值
				//console.log(type);//1
			}
		});
		var optionArr = $("[name=type]").children("option");
		optionArr.each(function(){
			//console.log($(this).attr("value").trim()+"999");
			//console.log($(this).attr("value").trim()==type);//true
			if ($(this).attr("value").trim()==type) {
				$(this).attr("selected","selected");
			}
		});
		$("[name=id]").val(id);
		$("[name=title]").val(title);
		$("[name=content]").val(content);
		$("[type=hidden]").val(id);
		$("#updateDiv").show();
		$("#managerDiv").hide();
	}
	//点修改提交按钮
	function updateSubmit(){
		$("#updateNewsForm").submit();
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
			location.href="news/newsManager?currentPage="+pageNo;
		}
	}
	//点新闻编号:显示新闻详细信息页面detailDiv+隐藏新闻管理页面managerDiv+用ajax根据编号查出新闻的详细内容显示到newDetailDiv中
	function showNewsDetail(obj){
		console.log("showNewsDetail()...");
		var id=$(obj).parents("td").text().trim();
		console.log(id);//
		location.href="news/newsDetail?id="+id;
	}
</script>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>><a
				href="news/newsManager">新闻管理</a>
		</div>
		<div id="managerDiv" class="public-content" style="display: block">
			<div class="public-content-header">
				<h3>新闻管理</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width: 10%">新闻编号</th>
						<th style="width: 20%">新闻标题</th>
						<th style="width: 20%">新闻简述</th>
						<th style="width: 20%">添加时间</th>
						<th style="width: 10%">添加用户</th>
						<th style="width: 20%">操作</th>
					</tr>

					<c:forEach items="${pageResult.dataList }" var="newsDTO">
						<tr>
							<td><a href="javascript:;" class="a_line" onclick="showNewsDetail(this)">${newsDTO.id }</a></td>
							<td>${newsDTO.title }</td>
							<td>${newsDTO.content }</td>
							<td>${newsDTO.createDate }</td>
							<td>${newsDTO.username }</td>
							<td>
								<div class="table-fun">
									<a href="javascript:;" onclick="updateNews(this)">修改</a> <a
										href="javascript:;" onclick="deleteNews(this)">删除</a>
								</div>
							</td>
						</tr>
					</c:forEach>
<%-- 					<c:forEach items="${newsDTOList }" var="newsDTO">
						<tr>
							<td>${newsDTO.id }</td>
							<td>${newsDTO.title }</td>
							<td>${newsDTO.content }</td>
							<td>${newsDTO.createDate }</td>
							<td>${newsDTO.username }</td>
							<td>
								<div class="table-fun">
									<a href="javascript:;" onclick="updateNews(this)">修改</a> <a
										href="javascript:;" onclick="deleteNews(this)">删除</a>
								</div>
							</td>
						</tr>
					</c:forEach> --%>
					<!-- <tr>
						<td>1</td>
						<td>云水禅心 - 古筝版纯音乐</td>
						<td>/music/49.mp3</td>
						<td></td>
						<td>
							<div class="table-fun">
								<a href="">修改</a>
								<a href="">删除</a>
							</div>
						</td>
					</tr> -->
				</table>
				<div class="page">
					<form action="" method="get">
						共<span>${pageResult.totalCount }</span>条记录
						 <a href="javascript:location.href='news/newsManager?currentPage=1'">首页</a>
						 <c:if test="${pageResult.currentPage!=1}">
							 <a href="javascript:location.href='news/newsManager?currentPage=${pageResult.currentPage-1}'">上一页</a> 
						 </c:if>
						 <c:if test="${pageResult.currentPage!=pageResult.totalPage}">
							 <a href="javascript:location.href='news/newsManager?currentPage=${pageResult.currentPage+1}'">下一页</a> 
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
				<h3>新闻修改</h3>
			</div>
			<div class="public-content-cont">
				<form id="updateNewsForm" action="news/updateNews" method="POST">
					<input type="hidden" name="id" value="">
					<div class="form-group">
						<label for="">新闻编号</label> <input class="form-input-txt"
							type="text" name="id" value="" disabled="disabled" />
					</div>
					<div class="form-group">
						新闻标题 <input class="form-input-txt" type="text" name="title"
							value="" />
					</div>
					<div class="form-group">
						<label for="">新闻的分类</label> <select class="form-input-txt"
							name="type">
							<option value="0">娱乐</option>
							<option value="1">国际</option>
							<option value="2">体育</option>
						</select>
					</div>
					<!-- <div class="file"><input type="file" class="form-input-file" />选择文件</div>
					<div class="file"><input type="submit" class="form-input-file"/>上传</div> -->
					<div class="clearfix"></div>
					<div class="form-group">
						<label for="">新闻的内容</label>
						<textarea id="editor_id" name="content" class="form-input-textara"
							style="width: 500px; height: 100px;"></textarea>
					</div>
					<div class="form-group" style="margin-left: 150px;">
						<!-- <input type="submit" class="sub-btn" value="提  交" /> -->
						<input type="button" class="sub-btn" onclick="updateSubmit()"
							value="提  交" /> <input type="reset" class="sub-btn" value="重  置" />
					</div>
				</form>
			</div>
		</div>
		<!-- 新闻详情页面 -->
		<!-- <div id="detailDiv" class="public-content" style="display: block">
			<div class="public-content-header">
				<h3>新闻详情</h3>
			</div>
			待续...
		</div> -->
	</div>
</body>
</html>