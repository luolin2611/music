<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>网站后台管理模版</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/admin.css" />
</head>

<body>
	<div class="page-content-wrap">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline tool-btn">
					<button
						class="layui-btn layui-btn-small layui-btn-normal addBtn hidden-xs"
						data-url="toAddSysUser.do">
						<i class="layui-icon">&#xe654;</i>
					</button>
				</div>
				<div class="layui-inline">
					<input type="text" name="title" placeholder="请输入标题"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-inline">
					<select name="category" lay-filter="status">
						<option value="0">主导航</option>
						<option value="010">关于我们</option>
						<option value="021">产品中心</option>
						<option value="021">新闻中心</option>
						<option value="021">业务范围</option>
						<option value="021">联系我们</option>
						<option value="021">在线留言</option>
					</select>
				</div>
				<button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
			</div>
		</form>
		<div class="layui-form" id="table-list">
			<table class="layui-table" lay-even lay-skin="nob">
				<thead>
					<tr>
						<th><input type="checkbox" name="" lay-skin="primary"
							lay-filter="allChoose"></th>
						<th>用户名</th>
						<th>用户昵称</th>
						<th>权限</th>
						<th>添加者</th>
						<th>添加时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${suList}" var="sysUser" >
						<tr>
							<td><input type="checkbox" name="" lay-skin="primary" data-id="1"></td>
							<td>${sysUser.user_name}</td>
							<td>${sysUser.real_name}</td>
							<td>
								<c:choose>  
									<c:when test="${sysUser.user_level=='01'}">  
										所有者  
								    </c:when>  
								    <c:when test="${sysUser.user_level=='02'}">  
								       拥有上传、删除歌曲  
								    </c:when>  
								    <c:when test="${sysUser.user_level=='03'}">  
								       拥有上传歌曲  
								    </c:when>  
								    <c:when test="${sysUser.user_level=='04'}">  
								       拥有删除歌曲  
								    </c:when>  
								    <c:when test="${sysUser.user_level=='05'}">  
								       游客模式，只能浏览 
								    </c:when>  
								</c:choose>  
							</td>
							<td>${sysUser.add_user_name}</td>
							<td><fmt:formatDate value="${sysUser.update_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>
								<c:if test="${sysUser.status == '00' }">
									在用
								</c:if>
								<c:if test="${sysUser.status == '01' }">
									禁用
								</c:if>
							</td>
							<td>
								<div class="layui-inline">
									<button
										class="layui-btn layui-btn-mini layui-btn-normal  edit-btn"
										data-id="1" data-url="menu-add2.html">
										<i class="layui-icon">&#xe642;</i>
									</button>
									<button
										class="layui-btn layui-btn-mini layui-btn-danger del-btn"
										data-id="1" data-url="del.html">
										<i class="layui-icon">&#xe640;</i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.config({
			base : '${pageContext.request.contextPath}/static/js/module/'
		}).extend({
			dialog : 'dialog',
		});
		layui.use([ 'form', 'jquery', 'layer' ], function() {
			var $ = layui.jquery, layer = layui.layer;
			//获取当前iframe的name值
			var iframeObj = $(window.frameElement).attr('name');
			console.log(iframeObj);
			$('.addBtn').click(function() {
				var url = $(this).attr('data-url');
				//将iframeObj传递给父级窗口,执行操作完成刷新
				parent.page("菜单添加", url, iframeObj, w = "700px", h = "620px");
				return false;

			})

			//修改状态
			$('#table-list').on(
					'click',
					'.table-list-status',
					function() {
						var That = $(this);
						var status = That.attr('data-status');
						var id = That.parent().attr('data-id');
						if (status == 1) {
							That.removeClass('layui-btn-normal').addClass(
									'layui-btn-warm').html('隐藏').attr(
									'data-status', 2);
						} else if (status == 2) {
							That.removeClass('layui-btn-warm').addClass(
									'layui-btn-normal').html('显示').attr(
									'data-status', 1);

						}
					})

		});
	</script>
	<%-- <script src="${pageContext.request.contextPath}/static/js/common.js" type="text/javascript" charset="utf-8"></script> --%>
</body>

</html>