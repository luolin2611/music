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
		String imgId = UUID.getUUID("Y","45");//上传图片后，将此用作music_dict_id
	%>
	<div class="layui-tab page-content-wrap">
		<ul class="layui-tab-title">
			<li class="layui-this">歌曲类别</li>
			<li>添加类别</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<table class="layui-table" lay-even lay-skin="nob">
					<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary"
								lay-filter="allChoose"></th>
							<th>名称</th>
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
					id="add_dict_form">
					<div class="layui-form-item">
						<label class="layui-form-label">名称：</label>
						<div class="layui-input-block">
							<input type="text" name="dict_name" required
								lay-verify="required" placeholder="请输入类别名称" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">图片：</label>
						<button type="button" class="layui-btn" id="upload_img"><i class="layui-icon">&#xe67c;</i>上传图片</button>
						<span id="showUploadStatus" style="display:none">上传成功！</span>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit
								lay-filter="add_dict">立即提交</button>
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
		  	upload.render({ //上传文件
		  	  	elem: '#upload_img',
		  	  	ext: 'jpg|png|gif',
		  	  	url: '${pageContext.request.contextPath}/fileDicImgUpload.do', 
		  	  	field:'dictImg',
		  	  	acceptMime:'image/*',
		  	 	data: {
		  	  		'img_id':'<%= imgId%>'
		  	  	},
		  	  	done: function(res, index, upload){
		  	  		$("#showUploadStatus")[0].style.display = ''; 
		  	  		if(res.status == "success") {
			  	  		layer.open({
			  	  		  title: '提示信息',
			  	  		  content: '上传完毕！'
			  	  		});   
		  	  		}
		  	  	},
		  	  	error: function(index, upload){
		  	  		$("#showUploadStatus")[0].style.display = "none";
		  	  		layer.open({
		  	  		  title: '错误信息',
		  	  		  content: '上传文件错误，请重试！'
		  	  		});   
		  	  	}
		  	});
		  	form.on('submit(add_dict)',function(data) {
				$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/createDict.do',
				dataType : 'json',
				data : {//请求的数据，
					'music_dict_id':'<%= imgId%>',
					'dict_name' : data.field.dict_name,
				},
				success : function(data) {
					if (data.status === "success") {
						layer.alert("添加音乐类别成功！",{
							title : '提示信息'
						},function(index){
							layer.close(index);
							location.href="${pageContext.request.contextPath}/musicDict.do";
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