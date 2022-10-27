package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.GraphVO;

public interface BookingService {
	public List<BookingVO> bookingAllList(String seller_id) throws Exception;
	
	public List<BookingVO> bookingAllSignList(Map bookSign) throws Exception;
	
	public int s_bookingCount(String seller_id)throws Exception;
	
	public int groupBookSignOn(Map<String, Object> listMap) throws Exception;
	
	public int groupBookSignOff(Map<String, Object> listMap) throws Exception;
	
	public int bookingSignOn(String order_id) throws Exception;
	
	public int bookingSignOff(String order_id) throws Exception;
	
	public int todayBookingCount(String seller_id)throws Exception;
	
	public List<GraphVO> monthsBookingCount(String seller_id)throws Exception;
	

}
