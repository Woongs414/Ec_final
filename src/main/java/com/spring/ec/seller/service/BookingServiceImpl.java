package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.BookingDAO;
import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.GraphVO;

@Service("sellerBookingService")
public class BookingServiceImpl implements BookingService {
	@Autowired
	BookingDAO bookingDAO;
	
	@Override
	public List<BookingVO> bookingAllList(String seller_id) throws Exception{
		return bookingDAO.selectAllBookingList(seller_id);
	}
	
	@Override
	public List<BookingVO> bookingAllSignList(Map bookSign) throws Exception{
		return bookingDAO.selectAllBookingSignList(bookSign);
	}
	
	@Override
	public int s_bookingCount(String seller_id)throws Exception{
		return bookingDAO.sellerBookingPaging(seller_id);
	}
	
	@Override
	public int groupBookSignOn(Map<String, Object> listMap) throws Exception {
		return bookingDAO.updateGroupSignOn(listMap);
	}
	
	@Override
	public int groupBookSignOff(Map<String, Object> listMap) throws Exception {
		return bookingDAO.updateGroupSignOff(listMap);
	}
	
	@Override
	public int bookingSignOn(String order_id) throws Exception {
		return bookingDAO.updateSignOn(order_id);
	}
	
	@Override
	public int bookingSignOff(String order_id) throws Exception {
		return bookingDAO.updateSignOff(order_id);
	}
	
	@Override
	public int todayBookingCount(String seller_id)throws Exception{
		return bookingDAO.selectTodayBooking(seller_id);
	}
	
	@Override
	public List<GraphVO> monthsBookingCount(String seller_id)throws Exception{
		return bookingDAO.selectMonthsBooking(seller_id);
	}
}
