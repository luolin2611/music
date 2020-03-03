<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>音乐后台管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/admin.css"/>
	</head>
	<body>
		<div class="main-layout" id='main-layout'>
			<!--侧边栏-->
			<div class="main-layout-side">
				<div class="m-logo">
				</div>
				<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				  <li class="layui-nav-item">
				    <a href="javascript:;" data-url="musicManager.do" data-id='1' data-text="音乐管理"><i class="layui-icon" style="font-size: 22px;margin-right:10px;padding-top:5px;">&#xe6fc;</i>音乐管理</a>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;" data-url="musicDict.do" data-id='2' data-text="歌曲类别"><i class="layui-icon" style="font-size: 22px;margin-right:10px;padding-top:10px;">&#xe63c;</i>歌曲类别</a>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="layui-icon" style="font-size: 22px;margin-right:10px;padding-top:10px;">&#xe620;</i>用户管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" data-url="toSysUserMessage.do" data-id='3' data-text="个人信息"><span class="l-line"></span>个人信息</a></dd>
				      <c:if test="${sysUser.user_level == '01' }">
				      	<dd><a href="javascript:;" data-url="toSysUserManger.do" data-id='4' data-text="用户管理"><span class="l-line"></span>添加用户</a></dd>
				    	  </c:if>
				    </dl>
				  </li>
				</ul>
			</div>
			<!--右侧内容-->
			<div class="main-layout-container">
				<!--头部-->
				<div class="main-layout-header">
					<div class="menu-btn" id="hideBtn">
						<a href="javascript:;">
							<span class="iconfont">&#xe60e;</span>
						</a>
					</div>
					<ul class="layui-nav">
					  <li class="layui-nav-item">${greetings_str}</li>
					  <li class="layui-nav-item"><a href="javascript:;" class="logout_btn">退出</a></li>
					</ul>
				</div>
				<!--主体内容-->
				<div class="main-layout-body">
					<!--tab 切换-->
					<div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
					  <ul class="layui-tab-title">
					    <li class="layui-this welcome">后台主页</li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
					    	<!--1-->
					   		<iframe src="toWelcome.do" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
					    	<!--1end-->
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!--遮罩-->
			<div class="main-mask">
				
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			layui.config({
				base: '${pageContext.request.contextPath}/static/js/module/'
			}).extend({
				dialog: 'dialog',
			});
			layui.use(['form', 'jquery', 'laydate', 'layer', 'laypage', 'element', 'dialog'], function() {
				var form = layui.form(),
					layer = layui.layer,
					dialog = layui.dialog;
					$ = layui.jquery,element=layui.element;
					
					$('.logout_btn').click(function() {
						dialog.confirm({
							message:'您确定退出登录吗？',
							success:function(){
								location.href="${pageContext.request.contextPath}/sysUserLogout.do";
							},
							cancel:function(){
								layer.msg('取消')
							}
						})
						
						return false;
					})
					
			});
			
			
			
			
			
		</script>
		<script src="${pageContext.request.contextPath}/static/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/static/js/main.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
