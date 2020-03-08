package com.music.core.service.music;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.core.dao.music.AppMusicDao;

@Service
public class AppMusicServiceImpl implements AppMusicService {
	@Autowired
	private AppMusicDao appMusicDao;

	
}
