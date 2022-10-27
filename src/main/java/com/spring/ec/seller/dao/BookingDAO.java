package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.GraphVO;

public interface BookingDAO {
	public List<BookingVO> selectAllBookingList(String seller_id) throws DataAccessException;
	
	public List<BookingVO> selectAllBookingSignList(Map bookSign) throws DataAccessException;
	
	public int sellerBookingPaging(String seller_id) throws DataAccessException;
	
	public int updateGroupSignOn(Map<String, Object> listMap) throws Exception;
	
	public int updateGroupSignOff(Map<String, Object> listMap) throws Exception;
	
	public int updateSignOn(String order_id) throws Exception;
	
	public int updateSignOff(String order_id) throws Exception;
	
	public int selectTodayBooking(String seller_id) throws Exception;
	
	public List<GraphVO> selectMonthsBooking(String seller_id) throws Exception;
}
