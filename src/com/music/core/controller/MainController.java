package com.music.core.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.core.dao.sys_user.SysUserDao;
import com.music.core.po.Music;
import com.music.core.po.SysUser;
import com.music.core.service.music.MusicService;

@Controller
public class MainController {
	@Autowired
	private SysUserDao sysUserDao;
	@Autowired
	private MusicService musicService;

	@RequestMapping("/toWelcome")
	public String toWelcome() {
		return "welcome";
	}

	@RequestMapping("/toSysUserManger")
	public String toSysUserManger(Model model) {
		List<SysUser> suList = sysUserDao.findAllSysUser();
		model.addAttribute("suList", suList);
		return "sysUserManager";
	}

	// go to musicManager.jsp
	@RequestMapping("/toMusicManager")
	public String toMusicManager(HttpSession session, Model model) {
		model.addAttribute("musicList", musicService.findAllMusic());
		model.addAttribute("musicDictList", musicService.findMusicDictList());
		return "musicManager";
	}

	// go to toSingerManager.jsp
	@RequestMapping("/toSingerManager")
	public String toSingerManager(HttpSession session, Model model) {
		model.addAttribute("musicList", musicService.findAllMusic());
		model.addAttribute("musicDictList", musicService.findMusicDictList());
		return "singerManager";
	}

	// go to musicDict.jsp
	@RequestMapping("/toMusicDict")
	public String musicSort(HttpSession session, Model model) {
		model.addAttribute("musicDictList", musicService.findMusicDictList());
		return "musicDict";
	}

	@RequestMapping("/toAddSysUser")
	public String toAddSysUser() {
		return "addSysUser";
	}

	@RequestMapping("/toSysUserMessage")
	public String toSysUserMessage(HttpSession session, Model model) {
		SysUser su = (SysUser) session.getAttribute("USER_SESSION");
		model.addAttribute("sysUser", su);
		return "sysUserPersonalMessage";
	}
}
