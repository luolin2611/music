package com.music.comm;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static String handleFormUpload(MultipartFile uploadfile, String dirPath, String imgId) {
		// 获取上传文件的原始名称
		String originalFilename = uploadfile.getOriginalFilename();
		// 设置上传文件的保存地址目录
		File filePath = new File(dirPath);
		System.out.println(dirPath);
		// 如果保存文件的地址不存在，就先创建目录
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		// 使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
//		String newFilename = UUID.randomUUID() + "_" + originalFilename;
		try {
			// 使用MultipartFile接口的方法完成文件上传到指定位置
			uploadfile.transferTo(new File(filePath.getAbsolutePath() + imgId+originalFilename.substring(originalFilename.lastIndexOf("."))));
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return dirPath + imgId+originalFilename.substring(originalFilename.lastIndexOf("."));
	}
	
	public static String singleFileUpload(MultipartFile uploadfile, String dirPath, String fileName) {
		String originalFilename = uploadfile.getOriginalFilename();// 获取上传文件的原始名称
		File filePath = new File(dirPath);// 设置上传文件的保存地址目录
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		String fileFullName = filePath.getAbsolutePath() + "/" + fileName + originalFilename.substring(originalFilename.lastIndexOf("."));
		try {
			uploadfile.transferTo(new File(fileFullName));// 使用MultipartFile接口的方法完成文件上传到指定位置
			System.out.println(fileFullName);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return fileFullName;
	}
}
