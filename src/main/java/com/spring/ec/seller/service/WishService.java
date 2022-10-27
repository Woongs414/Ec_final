package com.spring.ec.seller.service;

import java.util.List;

import com.spring.ec.seller.vo.GraphVO;

public interface WishService {
	public int todayWishCount(String seller_id) throws Exception;
	
	public List<GraphVO> monthsWishCount(String seller_id)throws Exception;
}
