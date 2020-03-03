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
<title>音乐网站后台管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/layui/css/layui.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<ul class="layui-tab-title">
			<li class="layui-this">个人信息</li>
			<li>修改密码</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<form class="layui-form" style="width: 90%; padding-top: 20px;">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-block">
							<input type="text" name="id" disabled autocomplete="off"
								class="layui-input layui-disabled" value="${sysUser.user_name }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户昵称：</label>
						<div class="layui-input-block">
							<input type="text" name="name" required lay-verify="required"
								placeholder="请输入标题" autocomplete="off"
								class="layui-input layui-disabled" value="${sysUser.real_name }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户权限：</label>
						<div class="layui-input-block">
							<input type="text" name="email" required lay-verify="required"
								placeholder="请输入标题" autocomplete="off"
								class="layui-input layui-disabled"
								value="<c:choose><c:when test="${sysUser.user_level=='01'}">所有者</c:when><c:when test="${sysUser.user_level=='02'}">拥有上传、删除歌曲</c:when><c:when test="${sysUser.user_level=='03'}">拥有上传歌曲</c:when><c:when test="${sysUser.user_level=='04'}">拥有删除歌曲</c:when><c:when test="${sysUser.user_level=='05'}">游客模式，只能浏览</c:when></c:choose>">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">创建时间：</label>
						<div class="layui-input-block">
							<input type="text" name="username" disabled autocomplete="off"
								class="layui-input layui-disabled"
								value="<fmt:formatDate value="${sysUser.update_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">创建者：</label>
						<div class="layui-input-block">
							<input type="text" name="username" disabled autocomplete="off"
								class="layui-input layui-disabled"
								value="${sysUser.add_user_name }">
						</div>
					</div>
				</form>
			</div>
			<div class="layui-tab-item">
				<form class="layui-form" style="width: 90%; padding-top: 20px;" id="update_sys_user">
					<div class="layui-form-item">
						<label class="layui-form-label">旧密码：</label>
						<div class="layui-input-block">
							<input type="password" name="oldPassword" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">新密码：</label>
						<div class="layui-input-block">
							<input type="password" name="newPassword1" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">重复密码：</label>
						<div class="layui-input-block">
							<input type="password" name="newPassword2" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit
								lay-filter="alert_password_submit">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use(['form','element','jquery','layer'], function(){
			  var form = layui.form();
			  var element = layui.element();
			  var $ = layui.jquery;
			  var layer = layui.layer;
			  form.render();
			  form.on('submit(alert_password_submit)', function(data){
				  if(data.field.newPassword1 !== data.field.newPassword2){
					  layer.msg(JSON.stringify('新密码不一致，请重新输入！'));
				  } else {
					  $.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/alterSysPassword.do',
							dataType : 'json',
							data : {//请求的数据，
								'oldPassword' : data.field.oldPassword,
								'newPassword1' : data.field.newPassword1
							},
							success : function(data) {
								if(data.status === "success"){
									layer.alert(JSON.stringify(data.message), {
										title : '提示信息'
									}) ;
									$("#update_sys_user")[0].reset();//清空表单
									form.render();//刷新表单
								} else {
									layer.alert(JSON.stringify(data.message), {
										title : '错误提示'
									}) ;
								}
								
							},
							error : function(jqXHR) {
								//请求失败函数内容
								layer.alert(JSON.stringify(jqXHR), {
									title:'请求出错'
								});
							}
				  		});
				  }
				  return false;
			  });
		});
	</script>
</body>
</html>