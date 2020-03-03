package com.music.core.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.core.dao.sys_user.SysUserDao;
import com.music.core.po.SysUser;

@Controller
public class MainController {
	@Autowired
	private SysUserDao sysUserDao;
	
	@RequestMapping("/toWelcome")
	public String toWelcome() {
		return "welcome";
	}
	
	@RequestMapping("/toSysUserManger")
	public String toSysUserManger(Model model) {
		List<SysUser> suList = sysUserDao.findAllSysUser();
		model.addAttribute("suList",suList);
		return "sysUserManager";
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
