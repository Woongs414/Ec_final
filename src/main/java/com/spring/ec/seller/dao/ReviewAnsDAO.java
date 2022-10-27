package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.GraphVO;
import com.spring.ec.seller.vo.ReviewAnsVO;

public interface ReviewAnsDAO {
	public List<ReviewAnsVO> selectAllReAnsList(Map reAns) throws DataAccessException;
	
	public int selectReAnsListCount(Map reAns) throws DataAccessException;
	
	public int insertAddNewAnswer(Map answer) throws DataAccessException;
	
	public int deleteAnswer(Map answer) throws DataAccessException;
	
	public int selectTodayReview(String seller_id) throws Exception;
	
	public List<GraphVO> selectMonthsReview(String seller_id) throws Exception;
}
