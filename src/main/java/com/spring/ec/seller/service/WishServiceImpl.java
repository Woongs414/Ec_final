package com.spring.ec.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.WishDAO;
import com.spring.ec.seller.vo.GraphVO;

@Service("wishService")
public class WishServiceImpl implements WishService {
	@Autowired
	WishDAO wishDAO;
	
	@Override
	public int todayWishCount(String seller_id) throws Exception{
		return wishDAO.selectTodayWish(seller_id);
	}
	
	@Override
	public List<GraphVO> monthsWishCount(String seller_id)throws Exception{
		return wishDAO.selectMonthsWish(seller_id);
	}
}
