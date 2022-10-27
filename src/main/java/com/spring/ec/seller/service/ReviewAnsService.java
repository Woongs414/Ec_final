package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.seller.vo.GraphVO;
import com.spring.ec.seller.vo.ReviewAnsVO;
import com.spring.ec.user.vo.ReviewVO;

public interface ReviewAnsService {
	
	public List<ReviewAnsVO> reAnsAllList(Map reAns) throws Exception;
	
	public int reAnsListCount(Map reAns) throws Exception;
	
	public int addNewAnswer(Map answer) throws Exception;
	
	public int removeAnswer(Map answer) throws Exception;
	
	public int todayReviewCount(String seller_id) throws Exception;
	
	public List<GraphVO> monthsReviewCount(String seller_id)throws Exception;
}
