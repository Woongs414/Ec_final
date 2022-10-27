package com.spring.ec.user.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.NoticeVO;

public interface NoticeDAO {
	public List selectNoticeList(int page) throws DataAccessException;
	
	public List selectEventList(int page) throws DataAccessException;
	
	public NoticeVO selectNotice(int list_num) throws DataAccessException;
	
	public void addNoticeHits(int list_num)throws DataAccessException;
	
	public int noticePaging() throws DataAccessException;
	
	public int eventPaging() throws DataAccessException;
}
