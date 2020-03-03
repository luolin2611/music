<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form class="layui-form" id="add_sys_user">
		<div class="layui-tab">
			<div class="layui-tab-content">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="user_name" required lay-verify="required"
							placeholder="请输入用户名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">登录密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" required
							lay-verify="required" placeholder="请输登录密码" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户昵称</label>
					<div class="layui-input-inline">
						<input type="text" name="real_name" required lay-verify="required"
							placeholder="请输入用户昵称" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">请选择权限</label>
					<div class="layui-input-block">
						<select name="user_level" lay-verify="required">
							<option value=""></option>
							<option value="01">所有权限</option>
							<option value="02">拥有上传、删除歌曲</option>
							<option value="03">拥有上传歌曲</option>
							<option value="04">拥有删除歌曲</option>
							<option value="05">仅仅查看数据</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script src="${pageContext.request.contextPath}/static/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'form', 'layedit', 'laydate', 'jquery'], function() {
			var form = layui.form(), layer = layui.layer, $ = layui.jquery;
			//监听提交
			form.on('submit(formDemo)', function(data) {
				$.post("${pageContext.request.contextPath }/addSysUser.action",
						$("#add_sys_user").serialize(), function(data) {
							if(data.status === 'success') {
								layer.alert(JSON.stringify(data.message), {
									title : '提示信息'
								})
								$("#add_sys_user")[0].reset();//清空表单
								form.render();//刷新表单
							} else {
								layer.alert(JSON.stringify(data.message), {
									title : '提示信息'
								})
							}
						});
				return false;
			});
		});
	</script>
</body>
</html>