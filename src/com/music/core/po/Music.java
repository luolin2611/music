package com.music.core.po;

import java.util.Date;

public class Music {
	private String music_id;
	private String author;
	private String file_duration;
	private String title;
	private SysUser sysUser;
	private String name;
	private Date update_time;
	private String music_img_path;
	private String status;
	private MusicDict musicDict;
	private String music_file_path;
	
	public String getMusic_file_path() {
		return music_file_path;
	}
	public void setMusic_file_path(String music_file_path) {
		this.music_file_path = music_file_path;
	}
	public String getMusic_id() {
		return music_id;
	}
	public void setMusic_id(String music_id) {
		this.music_id = music_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFile_duration() {
		return file_duration;
	}
	public void setFile_duration(String file_duration) {
		this.file_duration = file_duration;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public SysUser getSysUser() {
		return sysUser;
	}
	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getMusic_img_path() {
		return music_img_path;
	}
	public void setMusic_img_path(String music_img_path) {
		this.music_img_path = music_img_path;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public MusicDict getMusicDict() {
		return musicDict;
	}
	public void setMusicDict(MusicDict musicDict) {
		this.musicDict = musicDict;
	}
}
