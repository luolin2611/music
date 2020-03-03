package com.music.core.dao.music;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.music.core.po.Music;
import com.music.core.po.MusicDict;

public interface MusicDao {
	public void insertDictImgDictId(@Param("music_dict_id")String music_dict_id, @Param("dict_img_path")String dict_img_path);
	public String findMusiDictIdByMusiDict(@Param("music_dict_id")String music_dict_id, @Param("add_user_name")String add_user_name);
	public String findMusiDictIdByDictName(@Param("dict_name")String dict_name);
	public void updateMusicDict(MusicDict musicDict);
	public List<MusicDict> findMusicDictList();
	public List<Music> findAllMusic();
	/** 添加音乐 start 2019年04月16日07:58:45 */
	public String selectMusicIdByMusicId(@Param("music_id")String music_id);
	public void insertMusicFilePath(@Param("music_id")String music_id, @Param("music_file_path")String music_file_path, @Param("file_duration")String file_duration);
	public void updateMusicFilePath(@Param("music_id")String music_id, @Param("music_file_path")String music_file_path, @Param("file_duration")String file_duration);
	public void insertTitleImgFilePath(@Param("music_id")String music_id, @Param("music_img_path")String music_img_path);
	public void updateTitleImgFilePath(@Param("music_id")String music_id, @Param("music_img_path")String music_img_path);
	public String selectMusicByTitleOrName(@Param("name")String name, @Param("title")String title);
	public void updateMusic(@Param("music")Music music);
	/** 添加音乐end */
	
}
