package com.music.core.po;

import java.util.Date;
import java.util.List;

public class Music {
	private String music_id; //musicId
	private String author; //作者
	private String file_duration;//歌曲时长
	private String title;//歌曲title
	private SysUser sysUser;//后台用户
	private String name;//歌曲名称
	private Date update_time;//更新的时间
	private String music_img_path;//歌曲图片
	private String music_file_path;//歌曲文件路径
	private String status;//歌曲状态
	private Singer singer;//演唱者信息
	private MusicDict musicDict;//歌曲类型
	
	public Singer getSinger() {
		return singer;
	}
	public void setSinger(Singer singer) {
		this.singer = singer;
	}
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
