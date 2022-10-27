package com.spring.ec.user.service;

import java.util.List;

import com.spring.ec.user.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> noticeBoards(int page) throws Exception;

	public List<NoticeVO> eventBoards(int page) throws Exception;

	public int noticeCount() throws Exception;

	public int eventCount() throws Exception;

	public NoticeVO viewNotice(int list_num) throws Exception;

	public void addNoticeHits(int list_num) throws Exception;
}
