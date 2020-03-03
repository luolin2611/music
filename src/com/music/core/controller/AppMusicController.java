package com.music.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;


@Controller
public class AppMusicController {
	
	@RequestMapping("/queryAllMusic")
	@ResponseBody
	public String queryAllMusic(HttpServletRequest request) {
		JSONObject object = new JSONObject();
		return object.toString();
	}
}
