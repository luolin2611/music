package com.music.core.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.music.comm.FileUploadUtil;
import com.music.comm.Util;
import com.music.core.po.Music;
import com.music.core.po.MusicDict;
import com.music.core.po.SysUser;
import com.music.core.service.music.MusicService;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicService;

	@RequestMapping("/fileDicImgUpload")
	@ResponseBody
	public String fileDicImgUpload(HttpServletRequest request, @RequestParam("dictImg") MultipartFile dictImg,
			@RequestParam("img_id") String img_id) {
		String dirPath = request.getServletContext().getRealPath("/upload/dict_img/");
		String res = FileUploadUtil.handleFormUpload(dictImg, dirPath, img_id);
		JSONObject object = new JSONObject();
		if (!"error".equals(res)) {
			object.put("status", "success");
			musicService.insertDictImgDictId(img_id, res);
		}
		return object.toString();
	}

	@RequestMapping("/createDict")
	@ResponseBody
	public String createDict(HttpSession session, String music_dict_id, String dict_name) {
		SysUser su = (SysUser) session.getAttribute("USER_SESSION");
		return musicService.createDict(music_dict_id, su.getUser_name(), dict_name);
	}

	/**
	 * 单个文件上传
	 * 
	 * @param upload_file
	 *            上传的文件
	 * @param file_id
	 *            文件ID
	 * @param file_type
	 *            上传的文件类型：1.music_file （上传音乐文件）2.title_file（上传标题图片文件)
	 * @return
	 */
	@RequestMapping("/singleFileUpload")
	@ResponseBody
	public String singleFileUpload(HttpServletRequest request, @RequestParam("upload_file") MultipartFile upload_file,
			@RequestParam("file_id") String file_id, @RequestParam("file_type") String file_type) {
		String dirPath = request.getServletContext().getRealPath("/upload/" + file_type + "/");
		System.out.println(request.getContextPath());
		System.out.println(request.getSession().getServletContext().getRealPath(""));
		String originalFilename = upload_file.getOriginalFilename();
		String fileName = originalFilename.substring(0, originalFilename.lastIndexOf("."));//去掉后缀名的文件名称
		fileName = file_id; //ID
		String filePath = FileUploadUtil.singleFileUpload(upload_file, dirPath, fileName);
		String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")+1); //得到后缀名
		JSONObject object = new JSONObject();
		object.put("status","fail");
		object.put("message","服务器不知道怎么了，他报错啦！！");
		String insertFlag = object.toString();
		String rootPath =request.getSession().getServletContext().getRealPath(""); //得到根路径
		if (!"error".equals(filePath)) {
			object.put("status", "success");
			switch (file_type) {
			case "music_file":
				//处理时间显示
				int second = 0;
				if("mp3".equals(suffix.toLowerCase())) {
					second = Util.getMP3Duration(filePath);
				} 
				if("wav".equals(suffix.toLowerCase())) {
					second = Util.getWavDuration(filePath);
				} 
				if("flac".equals(suffix.toLowerCase())) {
					second = Util.getFlacDuration(filePath);
				} 
				String time = Util.secondToTime(second);
				musicService.insertMusicFilePath(file_id, filePath.split(rootPath)[1], time);
				break;
			case "title_file" :
				musicService.insertMusicTitleImgPath(file_id, filePath.split(rootPath)[1]);
				break;
			default:
				break;
			}
		}
		return insertFlag;
	}
	
	@RequestMapping("/addMusic")
	@ResponseBody
	public String addMusic(String music_id, String author, String title, String name, String music_dict_id, HttpSession session) {
		SysUser su = (SysUser) session.getAttribute("USER_SESSION");
		MusicDict musicDict = new MusicDict();
		musicDict.setMusic_dict_id(music_dict_id);
		Music music = new Music();
		music.setMusic_id(music_id);
		music.setAuthor(author);
		music.setTitle(title);
		music.setSysUser(su);
		music.setName(name);
		music.setUpdate_time(new Date());
		music.setMusicDict(musicDict);
		return musicService.insertMusic(music);
	}
}
