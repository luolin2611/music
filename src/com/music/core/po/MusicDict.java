package com.music.core.po;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MusicDict {
	private String music_dict_id;
	private String dict_name;
	private Date update_time;
	private String add_user_name;
	private String dict_img_path;
	private String status;
	private String music_num;//该类别的音乐数量

	public String getMusic_num() {
		return music_num;
	}

	public void setMusic_num(String music_num) {
		this.music_num = music_num;
	}

	public String getMusic_dict_id() {
		return music_dict_id;
	}

	public void setMusic_dict_id(String music_dict_id) {
		this.music_dict_id = music_dict_id;
	}

	public String getDict_name() {
		return dict_name;
	}

	public void setDict_name(String dict_name) {
		this.dict_name = dict_name;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public String getAdd_user_name() {
		return add_user_name;
	}

	public void setAdd_user_name(String add_user_name) {
		this.add_user_name = add_user_name;
	}

	public String getDict_img_path() {
		return dict_img_path;
	}

	public void setDict_img_path(String dict_img_path) {
		this.dict_img_path = dict_img_path;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "[music_dict_id = " + music_dict_id + ", dict_name = " + dict_name + ", update_time = "
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(update_time) + ", add_user_name = " + add_user_name
				+ ", dict_img_path = " + dict_img_path + ", music_num = " + music_num + ", status = " + status + "]";
	}
}
