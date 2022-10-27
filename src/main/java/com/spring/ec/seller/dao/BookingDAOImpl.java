package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.GraphVO;


@Repository("sellerBookingDAO")
public class BookingDAOImpl implements BookingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BookingVO> selectAllBookingList(String seller_id) throws DataAccessException {
		List<BookingVO> bookingList = sqlSession.selectList("mapper.booking.selectAllBookingList", seller_id);
		return bookingList;
	}
	
	@Override
	public List<BookingVO> selectAllBookingSignList(Map bookSign) throws DataAccessException {
		int page = (Integer) bookSign.get("page");
		page = (page - 1) * 10;
		bookSign.put("page", page);
		String period = (String) bookSign.get("period");
		List<BookingVO> bookingList = null;
		if(period == null || period.equals("all") ) {
			bookingList = sqlSession.selectList("mapper.booking.selectAllBookingSignList", bookSign);			
		} else if(period.equals("today")) {
			bookingList = sqlSession.selectList("mapper.booking.selectTodayBookingSignList", bookSign);
		} else if(period.equals("yesterday")) {
			bookingList = sqlSession.selectList("mapper.booking.selectYesterBookingSignList", bookSign);
		}		
		return bookingList;
	}
	
	@Override
	public int sellerBookingPaging(String seller_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.booking.selectSellerBookingCount", seller_id);
	}
	
	@Override
	public int updateGroupSignOn(Map<String, Object> listMap) throws Exception {
		int updateUserSign = sqlSession.update("mapper.booking.updateGroupUserSignOn",listMap);
		int updateNoUserSign = sqlSession.update("mapper.booking.updateGroupNoUserSignOn",listMap);
		return updateUserSign+updateNoUserSign;
	}
	
	@Override
	public int updateGroupSignOff(Map<String, Object> listMap) throws Exception {
		int updateUserSign = sqlSession.update("mapper.booking.updateGroupUserSignOff",listMap);
		int updateNoUserSign = sqlSession.update("mapper.booking.updateGroupNoUserSignOff",listMap);
		return updateUserSign+updateNoUserSign;
	}
	
	@Override
	public int updateSignOn(String order_id) throws Exception {
		int updateUserSign = sqlSession.update("mapper.booking.updateUserSignOn",order_id);
		int updateNoUserSign = sqlSession.update("mapper.booking.updateNoUserSignOn",order_id);
		return updateUserSign+updateNoUserSign;
	}
	
	@Override
	public int updateSignOff(String order_id) throws Exception {
		int updateUserSign = sqlSession.update("mapper.booking.updateUserSignOff",order_id);
		int updateNoUserSign = sqlSession.update("mapper.booking.updateNoUserSignOff",order_id);
		return updateUserSign+updateNoUserSign;
	}
	
	@Override
	public int selectTodayBooking(String seller_id) throws Exception {
		int bookingCount = sqlSession.selectOne("mapper.booking.selectTodayBooking",seller_id);
		return bookingCount;
	}
	
	@Override
	public List<GraphVO> selectMonthsBooking(String seller_id) throws Exception {
		List<GraphVO> monthsBooking = sqlSession.selectList("mapper.graph.selectMonthsBooking",seller_id);
		return monthsBooking;
	}
}
