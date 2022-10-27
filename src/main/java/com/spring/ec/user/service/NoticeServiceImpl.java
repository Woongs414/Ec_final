package com.spring.ec.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.NoticeDAO;
import com.spring.ec.user.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDAO noticeDAO;
	@Override
	public List<NoticeVO> noticeBoards(int page)throws Exception{
		return noticeDAO.selectNoticeList(page);
	}
	
	@Override
	public List<NoticeVO> eventBoards(int page)throws Exception{
		return noticeDAO.selectEventList(page);
	}
	
	@Override
	public int noticeCount()throws Exception{
		return noticeDAO.noticePaging();
	}
	
	@Override
	public int eventCount()throws Exception{
		return noticeDAO.eventPaging();
	}
	@Override
	public NoticeVO viewNotice(int list_num) throws Exception{
		return noticeDAO.selectNotice(list_num);
	}
	@Override
	public void addNoticeHits(int list_num)throws Exception{
		noticeDAO.addNoticeHits(list_num);
	}
}
