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
<title>新闻查询页面</title>
<style>
	.a_line{
		text-decoration:underline;
		color: blue;
	}
</style>
<script>
	$(function(){
		console.log("loaded...");
		if('${newsQueryObject}'!=''){
			var optionArr = $("#typeSelect option");
			//console.log('${newsQueryObject.type}');//2
			optionArr.each(function(){
				//console.log($(this).attr("value").trim());//0-1-2
				if($(this).attr("value").trim()=='${newsQueryObject.type}'.trim()){
					console.log("222...");
					$(this).attr("selected","selected");
				}
			});
			$("#newsInfoDiv").show();
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
			location.href="news/queryAdvNews?currentPage="+pageNo;
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
		<div class="public-nav">您当前的位置：<a href="javascript:window.parent.location='index.jsp'">管理首页</a>><a href="news/newsQuery.jsp">新闻查询</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>新闻查询</h3>
			</div>
			<div class="public-content-cont">
				<form id="queryAdvNewsForm" action="news/queryAdvNews" method="POST">
					<div class="form-group_query">
						<label for="">新闻编号</label>
						<input class="form-input-txt" type="text" name="id" value="${newsQueryObject.id }" />
						<label for="">新闻标题</label>
						<input class="form-input-txt" type="text" name="title" value="${newsQueryObject.title }" />
						<label for="">新闻的分类</label>
						<select id="typeSelect" class="form-input-txt" name="type">
		                   	<option value="" ></option>
		                   	<option value="0" >娱乐</option>
		                   	<option value="1" >国际</option>
		                   	<option value="2" >体育</option>
	                    </select>
	                    <!-- <input type="button" onclick="queryAdvByCondition()" class="sub-btn" value="查询" /> -->
	                    <input type="submit" class="sub-btn" value="查询" />
					</div>
				</form>		
			</div>
			<div id="newsInfoDiv" class="public-content-cont" style="display: none;">
				<table id="queryNewsTable" class="public-cont-table">
					<tr>
						<th style="width: 10%">新闻编号</th>
						<th style="width: 20%">新闻标题</th>
						<th style="width: 20%">新闻简述</th>
						<th style="width: 20%">添加时间</th>
						<th style="width: 10%">添加用户</th>
						<th style="width: 20%">新闻分类</th>
					</tr>

					<%-- <c:forEach items="${newsList }" var="item">
						<tr>
							<td>${item.id }</td>
							<td>${item.title }</td>
							<td>${item.content }</td>
							<td>${item.createDate }</td>
							<td>${item.user.username }</td>
							<td>
								<c:choose>
									<c:when test="${item.type==0 }">娱乐</c:when>
									<c:when test="${item.type==1 }">国际</c:when>
									<c:when test="${item.type==2 }">体育</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach> --%>
					<c:forEach items="${pageResult.dataList }" var="item">
						<tr>
							<td><a href="javascript:;" class="a_line" onclick="showNewsDetail(this)">${item.id }</a></td>
							<td>${item.title }</td>
							<td>${item.content }</td>
							<td>${item.createDate }</td>
							<td>${item.user.username }</td>
							<td>
								<c:choose>
									<c:when test="${item.type==0 }">娱乐</c:when>
									<c:when test="${item.type==1 }">国际</c:when>
									<c:when test="${item.type==2 }">体育</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="page">
					<form action="" method="get">
						共<span>${pageResult.totalCount }</span>条记录
						 <a href="javascript:location.href='news/queryAdvNews?currentPage=1'">首页</a>
						 <c:if test="${pageResult.currentPage!=1}">
							 <a href="javascript:location.href='news/queryAdvNews?currentPage=${pageResult.currentPage-1}'">上一页</a> 
						 </c:if>
						 <c:if test="${pageResult.currentPage!=pageResult.totalPage}">
							 <a href="javascript:location.href='news/queryAdvNews?currentPage=${pageResult.currentPage+1}'">下一页</a> 
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