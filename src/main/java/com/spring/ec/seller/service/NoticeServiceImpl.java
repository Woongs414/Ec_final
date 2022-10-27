package com.spring.ec.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.NoticeDAO;
import com.spring.ec.user.vo.NoticeVO;

@Service("sellerNoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDAO noticeDAO;
	@Override
	public List<NoticeVO> s_noticeBoards(int page)throws Exception{
		return noticeDAO.selectSellerNoticeList(page);
	}
	//메인페이지 공지사항
	@Override
	public List<NoticeVO> s_mainNoticeBoards(int page)throws Exception{
		return noticeDAO.selectSellerMainNoticeList(page);
	}
	
	@Override
	public int s_noticeCount()throws Exception{
		return noticeDAO.sellerNoticePaging();
	}
	
	@Override
	public NoticeVO s_viewNotice(int list_num) throws Exception{
		return noticeDAO.selectSellerNotice(list_num);
	}
	
	@Override
	public void s_addNoticeHits(int list_num)throws Exception{
		noticeDAO.s_addNoticeHits(list_num);
	}
}
