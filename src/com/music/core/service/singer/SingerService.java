package com.music.core.service.singer;

import com.music.core.po.Singer;
import com.music.core.po.SingerImg;

/**
 * @author luolin
 * time 2020-03-05 20:52:08
 */
public interface SingerService {
	/** insert singer photo start */
	public void insertSingerCoverImgPath(String singerId, String singerCoverPath);
	public String insertSingerPhotoImgPath(SingerImg si);
	/** insert singer photo end */
	public String insertSinger(Singer singer);
}
