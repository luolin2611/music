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
		String musicId = UUID.getUUID("Y","45");//1.该ID用作music_id  2.用作
	%>
	<div class="layui-tab page-content-wrap">
		<ul class="layui-tab-title">
			<li class="layui-this">歌曲类别</li>
			<li>上传歌曲</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<table class="layui-table" lay-even lay-skin="nob">
					<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary"
								lay-filter="allChoose"></th>
							<th>歌曲名称</th>
							<th>歌手</th>
							<th>歌曲时长</th>
							<th>状态</th>
							<th>所属类别</th>
							<th>添加者</th>
							<th>添加时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${musicList}" var="music">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td>${music.title}</td>
								<td>${music.author}</td>
								<td>${music.file_duration}</td>
								<td>
									<c:if test="${music.status == '00' }">
										在用
									</c:if> <c:if test="${music.status == '01' }">
										禁用
									</c:if>
								</td>
								<td>${music.musicDict.dict_name}</td>
								<td>${music.sysUser.user_name}</td>
								<td>
									<fmt:formatDate value="${music.update_time}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
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
					id="add_dict_form">
					<div class="layui-form-item">
						<label class="layui-form-label">歌曲标题：</label>
						<div class="layui-input-block">
							<input type="text" name="title" required
								lay-verify="required" placeholder="请输入歌曲标题" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌曲名称：</label>
						<div class="layui-input-block">
							<input type="text" name="name" required
								lay-verify="required" placeholder="请输入歌曲名称" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌手</label>
						<div class="layui-input-block">
							<select name="singer_id" lay-verify="required">
								<option value=""></option>
								<c:forEach items="${singerList}" var="singer" >
									<option value="${singer.singer_id}##${singer.singer_name}">${singer.singer_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌曲类别</label>
						<div class="layui-input-block">
							<select name="music_dict_id" lay-verify="required">
								<option value=""></option>
								<c:forEach items="${musicDictList}" var="musicDict" >
									<option value="${musicDict.music_dict_id}">${musicDict.dict_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">歌曲文件：</label>
						<button type="button" class="layui-btn" id="music_file"><i class="layui-icon">&#xe67c;</i>上传歌曲文件</button>
						<span id="showMusicFileStatus" style="display:none">上传成功！</span>
						<input type="hidden" name="music_file_hide" id="music_file_hide" value="">
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">标题图片：</label>
						<button type="button" class="layui-btn" id="title_file"><i class="layui-icon">&#xe67c;</i>上传标题图片</button>
						<span id="showTitleFileStatus" style="display:none">上传成功！</span>
						<input type="hidden" name="title_file_hide" id="title_file_hide"  value="">
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit
								lay-filter="add_music" id="add_music">立即提交</button>
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
		  	upload.render({ //上传歌曲文件
		  	  	elem: '#music_file',
		  	  	url: '${pageContext.request.contextPath}/singleFileUpload.do', 
		  	  	field:'upload_file',
		  	  	accept: 'file',
		  	  	exts:'wav|mp3|flac|ape|m4a',
		  	 	data: {
		  	  		'file_id':'<%= musicId%>',
		  	  		'file_type': 'music_file'
		  	  	},
		  	  	done: function(res, index, upload){
		  	  		$("#showMusicFileStatus")[0].style.display = '';
		  	  		document.getElementById("music_file_hide").value = "success";
		  	  		layer.open({
		  	  		  title: '提示信息',
		  	  		  content: '上传音乐文件成功！'
		  	  		});   
		  	  	},
		  	  	error: function(index, upload){
		  	  		$("#showMusicFileStatus")[0].style.display = "none";
		  	  		document.getElementById("music_file_hide").value = "";
		  	  		layer.open({
		  	  		  title: '错误信息',
		  	  		  content: '上传音乐文件错误，请重试！'
		  	  		});   
		  	  	}
		  	});
		  	upload.render({ //上传标题图片文件
		  	  	elem: '#title_file',
		  	  	url: '${pageContext.request.contextPath}/singleFileUpload.do', 
		  	  	field:'upload_file',
		  	  	accept: 'images',
		  	 	data: {
		  	  		'file_id':'<%= musicId%>',
		  	  		'file_type': 'title_file'
		  	  	},
		  	  	done: function(res, index, upload){
		  	  		$("#showTitleFileStatus")[0].style.display = ''; 
		  	  	 	document.getElementById("title_file_hide").value = "success";
		  	  		layer.open({
		  	  		  title: '提示信息',
		  	  		  content: '上传标题图片文件成功！'
		  	  		});   
		  	  	},
		  	  	error: function(index, upload){
		  	  		$("#showTitleFileStatus")[0].style.display = "none";
		  	  		document.getElementById("title_file_hide").value = "";
		  	  		layer.open({
		  	  		  title: '错误信息',
		  	  		  content: '上传标题图片文件错误，请重试！'
		  	  		});   
		  	  	}
		  	});
		  	form.on('submit(add_music)',function(data) {
		  		console.log(data);
		  		if(data.field.music_file_hide == '') {
		  			layer.alert("你是不是忘了上传歌曲文件？骚年，别着急啊！",{
		  				title : '提示信息'
		  			});
		  			return false;
		  		}
		  		
		  		if(data.field.title_file_hide == '') {
		  			layer.alert("零件不够，赶紧去上传标题图片文件吧！",{
		  				title : '提示信息'
		  			});
		  			return false;
		  		}
		  			
		  		if(data.field.imgs_file_hide == '') {
		  			layer.alert("你是不是老年痴呆了，居然忘记了上传歌曲图片集？",{
		  				title : '提示信息'
		  			});
		  			return false;
		  		}
		  		$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/addMusic.do',
					dataType : 'json',
					data : {//请求的数据，
						'music_id':'<%= musicId%>',
						'singer_id': data.field.singer_id,
						'title': data.field.title,
						'name': data.field.name,
						'music_dict_id': data.field.music_dict_id
					},
					success : function(data) {
						if (data.status === "success") {
							layer.alert("添加音乐成功！",{
								title : '提示信息'
							},function(index){
								layer.close(index);
								location.href="${pageContext.request.contextPath}/toMusicManager.do";
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