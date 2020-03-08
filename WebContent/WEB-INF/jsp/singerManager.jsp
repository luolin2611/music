<%@page import="com.music.comm.UUID"%>
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
	href="${pageContext.request.contextPath}/static/layui2_4_5/css/layui.css" />
</head>
<body>
	<%
		String imgId = UUID.getUUID("Y","45");//上传图片后，将此用作singer_id
	%>
	<div class="layui-tab page-content-wrap">
		<ul class="layui-tab-title">
			<li class="layui-this">歌手列表</li>
			<li>添加歌手</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<table class="layui-table" lay-even lay-skin="nob">
					<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary"
								lay-filter="allChoose"></th>
							<th>歌手名称</th>
							<th>添加者</th>
							<th>添加时间</th>
							<th>音乐总数</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${musicDictList}" var="musicDict">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td>${musicDict.dict_name}</td>
								<td>${musicDict.add_user_name}</td>
								<td><fmt:formatDate value="${musicDict.update_time}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${musicDict.music_num}</td>
								<td><c:if test="${musicDict.status == '00' }">
									在用
								</c:if> <c:if test="${musicDict.status == '01' }">
									禁用
								</c:if></td>
								<td>
									<div class="layui-inline">
										<button
											class="layui-btn layui-btn-mini layui-btn-normal  add-btn"
											data-id="1" data-url="menu-add2.html">
											<i class="layui-icon">&#xe654;</i>
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
			<div class="layui-tab-item">
				<form class="layui-form" style="width: 90%; padding-top: 20px;"
					id="add_singer_form">
					<div class="layui-form-item">
						<label class="layui-form-label">歌手名字：</label>
						<div class="layui-input-block">
							<input type="text" name="singer_name" required
								lay-verify="required" placeholder="请输入歌手名字" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌手封面：</label>
						<button type="button" class="layui-btn" id="singer_cover_path"><i class="layui-icon">&#xe67c;</i>上传图片</button>
						<span id="showCoverUploadStatus" style="display:none">上传成功！</span>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌手写真：</label>
						<button type="button" class="layui-btn" id="singer_photo_path"><i class="layui-icon">&#xe67c;</i>上传图片</button>
						<span id="showPhotoUploadStatus" style="display:none">上传成功！</span>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit
								lay-filter="add_singer">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/layui2_4_5/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		layui.use([ 'form', 'element', 'jquery', 'layer', 'upload' ],function() {
			var form = layui.form;
			var $ = layui.jquery;
			var layer = layui.layer;
			var upload = layui.upload;
			form.render();
		  	upload.render({ //上传封面文件
		  	  	elem: '#singer_cover_path',
		  	  	url: '${pageContext.request.contextPath}/uploadSingerImg.do', 
		  	  	field:'upload_file',
		  	  	accept: 'file',
		  	  	ext: 'jpg|png|gif',
		  	 	data: {
		  	  		'file_id':'<%= imgId%>',
		  	  		'file_type': 'cover_file'
		  	  	},
		  	  	done: function(res, index, upload){
		  	  		$("#showCoverUploadStatus")[0].style.display = ''; 
		  	  		if(res.status == "success") {
			  	  		layer.open({
			  	  		  title: '提示信息',
			  	  		  content: '图片上传成功！'
			  	  		});   
		  	  		}
		  	  	},
		  	  	error: function(index, upload){
		  	  		$("#showCoverUploadStatus")[0].style.display = "none";
		  	  		layer.open({
		  	  		  title: '错误信息',
		  	  		  content: '上传文件错误，请重试！'
		  	  		});   
		  	  	}
		  	});
		  	upload.render({ //上传写真文件
		  	  	elem: '#singer_photo_path',
		  	  	ext: 'jpg|png|gif',
		  	  	url: '${pageContext.request.contextPath}/uploadSingerImg.do', 
		  	  	field:'upload_file',
		  	  	acceptMime:'image/*',
		  	 	data: {
		  	  		'file_id':'<%= imgId%>',
		  	  		'file_type': 'photo_file'
		  	  	},
		  	  	done: function(res, index, upload){
		  	  		$("#showPhotoUploadStatus")[0].style.display = ''; 
		  	  		if(res.status == "success") {
			  	  		layer.open({
			  	  		  title: '提示信息',
			  	  		  content: '上传完毕！'
			  	  		});   
		  	  		}
		  	  	},
		  	  	error: function(index, upload){
		  	  		$("#showPhotoUploadStatus")[0].style.display = "none";
		  	  		layer.open({
		  	  		  title: '错误信息',
		  	  		  content: '上传文件错误，请重试！'
		  	  		});   
		  	  	}
		  	});
		  	form.on('submit(add_singer)',function(data) {
				$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/addSinger.do',
				dataType : 'json',
				data : {//请求的数据，
					'file_id':'<%= imgId%>',
					'singer_name' : data.field.singer_name,
				},
				success : function(data) {
					if (data.status === "success") {
						layer.alert("添加歌手成功！",{
							title : '提示信息'
						},function(index){
							layer.close(index);
							location.href="${pageContext.request.contextPath}/toSingerManager.do";
						});
					} else {
						layer.alert(JSON.stringify(data.message),{
							title : '错误提示'
						});
					}
				},
				error : function(jqXHR) {
					//请求失败函数内容
					layer.alert(JSON.stringify(jqXHR),{
						title : '请求出错'
					});}
				});
				return false;
			});
		});
	</script>
</body>
</html>