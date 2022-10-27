package com.spring.ec.seller.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.vo.GraphVO;

@Service("wishDAO")
public class WishDAOImpl implements WishDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectTodayWish(String seller_id) throws Exception {
		int ReviewCount = sqlSession.selectOne("mapper.wish.selectTodayWish",seller_id);
		return ReviewCount;
	}
	
	@Override
	public List<GraphVO> selectMonthsWish(String seller_id) throws Exception {
		List<GraphVO> monthsBooking = sqlSession.selectList("mapper.graph.selectMonthsWish",seller_id);
		return monthsBooking;
	}
}
