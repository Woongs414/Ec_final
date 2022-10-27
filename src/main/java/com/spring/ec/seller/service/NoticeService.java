package com.spring.ec.seller.service;

import java.util.List;

import com.spring.ec.user.vo.NoticeVO;

public interface NoticeService {
	//공지사항 게시판
	public List<NoticeVO> s_noticeBoards(int page)throws Exception;
	
	//메인페이지 공지사항
	public List<NoticeVO> s_mainNoticeBoards(int page)throws Exception;
	
	//공지사항 게시글 총 글수
	public int s_noticeCount()throws Exception;
	
	//공지사항 게시글 확인
	public NoticeVO s_viewNotice(int list_num) throws Exception;
	
	//공지사항 조회수
	public void s_addNoticeHits(int list_num)throws Exception;
}
