package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.ReviewAnsDAO;
import com.spring.ec.seller.vo.GraphVO;
import com.spring.ec.seller.vo.ReviewAnsVO;

@Service("reviewAnsService")
public class ReviewAnsServiceImpl implements ReviewAnsService {
	
	@Autowired
	private ReviewAnsDAO reAnsDAO;

	@Override
	public List<ReviewAnsVO> reAnsAllList(Map reAns) throws Exception{
		return reAnsDAO.selectAllReAnsList(reAns);
	}
	
	@Override
	public int reAnsListCount(Map reAns) throws Exception{
		return reAnsDAO.selectReAnsListCount(reAns);
	}
	
	@Override
	public int addNewAnswer(Map answer) throws Exception{
		return reAnsDAO.insertAddNewAnswer(answer);
	}
	
	@Override
	public int removeAnswer(Map answer) throws Exception{
		return reAnsDAO.deleteAnswer(answer);
	}
	
	@Override
	public int todayReviewCount(String seller_id) throws Exception{
		return reAnsDAO.selectTodayReview(seller_id);
	}
	
	@Override
	public List<GraphVO> monthsReviewCount(String seller_id)throws Exception{
		return reAnsDAO.selectMonthsReview(seller_id);
	}
}
