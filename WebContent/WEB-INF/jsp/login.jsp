<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>音乐后台管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/login.css" />
</head>

<body>
	<div class="m-login-bg">
		<div class="m-login">
			<h3>音乐后台管理</h3>
			<div class="m-login-warp">
				<form class="layui-form">
					<div class="layui-form-item">
						<input type="text" name="username" required lay-verify="required"
							placeholder="用户名" value="rollin" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item">
						<input type="text" value="123" name="password" required lay-verify="required"
							placeholder="密码" autocomplete="off" class="layui-input">
					</div>
					<%-- <div class="layui-form-item">
						<div class="layui-inline">
							<input type="text" name="verity" required lay-verify="required"
								placeholder="验证码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-inline">
							<img class="verifyImg"
								onclick="this.src=this.src+'?c='+Math.random();"
								src="${pageContext.request.contextPath}/static/images/login/yzm.jpg" />
						</div>
					</div> --%>
					<div class="layui-form-item m-login-btn">
						<div class="layui-inline">
							<button class="layui-btn layui-btn-normal" lay-submit
								lay-filter="login">登录</button>
						</div>
						<div class="layui-inline">
							<button type="reset" class="layui-btn layui-btn-primary">取消</button>
						</div>
					</div>
				</form>
			</div>
			<p class="copyright">Copyright 2015-2016 by XIAODU</p>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'form', 'layedit', 'laydate','jquery' ], function() {
			var form = layui.form(), layer = layui.layer, $ = layui.jquery;
			//监听提交
			form.on('submit(login)', function(data) {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/sysUserLogin.action',
					dataType : 'json',
					data : {//请求的数据，
						'username' : data.field.username,
						'password' : data.field.password
					},
					success : function(data) {
						if(data.status === "success"){
							location.href="${pageContext.request.contextPath}/toMainPage.action";
						} else {
							layer.alert(JSON.stringify(data.message), {
								title : '错误提示'
							}) 
						}
						
					},
					error : function(jqXHR) {
						//请求失败函数内容
						layer.alert(JSON.stringify(jqXHR), {
							title:'请求出错'
						})
					}
				})
				return false;
			});
		});
	</script>
</body>

</html>