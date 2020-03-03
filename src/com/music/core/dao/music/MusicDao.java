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
	//插入音乐文件路径
	public void insertMusicFilePath(@Param("music_id")String music_id, @Param("music_file_path")String music_file_path, @Param("file_duration")String file_duration);
	public void updateMusicFilePath(@Param("music_id")String music_id, @Param("music_file_path")String music_file_path, @Param("file_duration")String file_duration);
	//插入DictTitleImag 文件路径
	public void insertTitleImgFilePath(@Param("music_id")String music_id, @Param("music_img_path")String music_img_path);
	public void updateTitleImgFilePath(@Param("music_id")String music_id, @Param("music_img_path")String music_img_path);
	//插入MusicImags
	public int selectImgsCountByMusicId(@Param("music_id")String music_id); //插入图片的数量不能大于5张
	public void insertMusicImgsFilePath(@Param("img_id")String img_id, @Param("img_path")String img_path, @Param("music_id")String music_id);
	//根据歌曲的名字 和 歌曲的Title 查询是否插入过歌曲
	public String selectMusicByTitleOrName(@Param("name")String name, @Param("title")String title);
	//提交按钮的更新补齐所有信息
	public void updateMusic(@Param("music")Music music);
	/** 添加音乐end */
}
