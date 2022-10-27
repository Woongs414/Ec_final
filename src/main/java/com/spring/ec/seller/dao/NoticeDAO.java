package com.spring.ec.seller.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.NoticeVO;

public interface NoticeDAO {
	public List selectSellerNoticeList(int page) throws DataAccessException;
	
	public List selectSellerMainNoticeList(int page) throws DataAccessException;
	
	public NoticeVO selectSellerNotice(int list_num) throws DataAccessException;
	
	public void s_addNoticeHits(int list_num) throws DataAccessException;
	
	public int sellerNoticePaging() throws DataAccessException;
	
	
}
