package com.music.core.po;

import java.util.Date;
import java.util.List;

public class Singer {
	private String singer_id;
	private String singer_name;
	private String singer_cover_path;
	private String add_sys_user_id;
	private Date update_time;//更新的时间
	private String status;//写真状态
	private List<Singer> singerImgList;
	
	public List<Singer> getSingerImgList() {
		return singerImgList;
	}
	public void setSingerImgList(List<Singer> singerImgList) {
		this.singerImgList = singerImgList;
	}
	public String getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(String singer_id) {
		this.singer_id = singer_id;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public String getSinger_cover_path() {
		return singer_cover_path;
	}
	public void setSinger_cover_path(String singer_cover_path) {
		this.singer_cover_path = singer_cover_path;
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
	public String getAdd_sys_user_id() {
		return add_sys_user_id;
	}
	public void setAdd_sys_user_id(String add_sys_user_id) {
		this.add_sys_user_id = add_sys_user_id;
	}
}
