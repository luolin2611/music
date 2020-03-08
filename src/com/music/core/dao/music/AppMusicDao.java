package com.music.core.dao.music;


import java.util.List;

import com.music.core.po.Music;

public interface AppMusicDao {
	/** 添加音乐 start 2019年04月16日07:58:45 */
	public List<Music> queryAllMusic();
	/** 添加音乐end */
}
