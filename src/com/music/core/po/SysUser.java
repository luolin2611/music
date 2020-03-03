package com.music.core.po;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SysUser {
	String user_id;
	String user_name;
	String password;
	Date update_time;
	String status;
	String user_level;
	String real_name;
	String add_user_name;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getAdd_user_name() {
		return add_user_name;
	}

	public void setAdd_user_name(String add_user_name) {
		this.add_user_name = add_user_name;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "[user_id = " + user_id + ", user_name = " + user_name + ", password = " + password + ", update_time = "
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(update_time) + ", status = " + status + ", user_level = " + user_level + ", real_name = " + real_name
				+ ", add_user_name = " + add_user_name + "]";
	}
}
