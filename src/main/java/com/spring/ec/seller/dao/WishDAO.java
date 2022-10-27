package com.spring.ec.seller.dao;

import java.util.List;

import com.spring.ec.seller.vo.GraphVO;

public interface WishDAO {
	public int selectTodayWish(String seller_id) throws Exception;
	
	public List<GraphVO> selectMonthsWish(String seller_id) throws Exception;
	
}
