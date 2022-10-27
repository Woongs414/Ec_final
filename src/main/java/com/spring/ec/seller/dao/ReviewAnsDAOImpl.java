package com.spring.ec.seller.dao;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ec.seller.vo.GraphVO;
import com.spring.ec.seller.vo.ReviewAnsVO;
import com.spring.ec.user.vo.MemberVO;

@Repository("reviewAnsDAO")
public class ReviewAnsDAOImpl implements ReviewAnsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewAnsVO> selectAllReAnsList(Map reAns) throws DataAccessException {
		int page = (Integer) reAns.get("page");
		page = (page - 1) * 4;
		reAns.put("page", page);
		String period = (String) reAns.get("period");
		List<ReviewAnsVO> reAnsList = null;
		if(period == null || period.equals("all") ) {
			reAnsList = sqlSession.selectList("mapper.review.selectAllReAnsList", reAns);			
		} else if(period.equals("today")) {
			reAnsList = sqlSession.selectList("mapper.review.selectTodayReAnsList", reAns);
		} else if(period.equals("yesterday")) {
			reAnsList = sqlSession.selectList("mapper.review.selectYesterReAnsList", reAns);
		}		
		return reAnsList;
	}
	
	@Override
	public int selectReAnsListCount(Map reAns) throws DataAccessException {
		String period = (String) reAns.get("period");
		int reAnsCount = 0;
		if(period == null || period.equals("all") ) {
			reAnsCount = sqlSession.selectOne("mapper.review.selectReAnsListCount", reAns);			
		} else if(period.equals("today")) {
			reAnsCount = sqlSession.selectOne("mapper.review.selectTodayReAnsListCount", reAns);
		} else if(period.equals("yesterday")) {
			reAnsCount = sqlSession.selectOne("mapper.review.selectYesterReAnsListCount", reAns);
		}		
		return reAnsCount;
	}
	
	@Override
	public int insertAddNewAnswer(Map answer) throws DataAccessException {
		int re_ans_num = selectNewAnswerNum();
		answer.put("re_ans_num", re_ans_num);
		return sqlSession.insert("mapper.review.inserNewAnswer", answer);
	}
	
	@Override
	public int deleteAnswer(Map answer) throws DataAccessException {
		return sqlSession.delete("mapper.review.deleteAnswer", answer);
	}
	
	private int selectNewAnswerNum() throws DataAccessException{
		return sqlSession.selectOne("mapper.review.selectNewAnswerNum");
	}
	
	@Override
	public int selectTodayReview(String seller_id) throws Exception {
		int ReviewCount = sqlSession.selectOne("mapper.review.selectTodayReview",seller_id);
		return ReviewCount;
	}
	
	@Override
	public List<GraphVO> selectMonthsReview(String seller_id) throws Exception {
		List<GraphVO> monthsBooking = sqlSession.selectList("mapper.graph.selectMonthsReview",seller_id);
		return monthsBooking;
	}
}
