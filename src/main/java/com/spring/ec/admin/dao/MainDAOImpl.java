package com.spring.ec.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.GraphVO;

@Repository("adminMainDAO")
public class MainDAOImpl implements MainDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Map<String, Object> selectMonthlyUserChart()throws DataAccessException{
		Map<String, Object> userChartList = new HashMap<String, Object>();
		List<GraphVO> visitorList = sqlSession.selectList("mapper.adGraph.selectMonthlyVisitor");
		List<GraphVO> reservList = sqlSession.selectList("mapper.adGraph.selectMonthlyReserv");
		List<GraphVO> reviewList = sqlSession.selectList("mapper.adGraph.selectMonthlyReview");
		List<GraphVO> signUpList = sqlSession.selectList("mapper.adGraph.selectMonthlySignUp");
		userChartList.put("visitList", visitorList);
		userChartList.put("reservList", reservList);
		userChartList.put("reviewList", reviewList);
		userChartList.put("signUpList", signUpList);
		
		return userChartList;
	}
	
	@Override
	public Map<String, Object> selectMonthlySellerChart()throws DataAccessException{
		Map<String, Object> sellerChartList = new HashMap<String, Object>();
		List<GraphVO> visitorList = sqlSession.selectList("mapper.adGraph.selectMonthlySellerVisitor");
		List<GraphVO> blackList = sqlSession.selectList("mapper.adGraph.selectMonthlyBlackList");
		List<GraphVO> whiteList = sqlSession.selectList("mapper.adGraph.selectMonthlyWhiteList");
		List<GraphVO> signUpList = sqlSession.selectList("mapper.adGraph.selectMonthlySellerSignUp");
		sellerChartList.put("visitList", visitorList);
		sellerChartList.put("blackList", blackList);
		sellerChartList.put("whiteList", whiteList);
		sellerChartList.put("signUpList", signUpList);
		
		return sellerChartList;
	}
	
	@Override
	public Map<String, Object> selectMonthlyCommuChart()throws DataAccessException{
		Map<String, Object> commuChartList = new HashMap<String, Object>();
		List<GraphVO> u_board = sqlSession.selectList("mapper.adGraph.selectMonthlyUserBoard");
		List<GraphVO> s_board = sqlSession.selectList("mapper.adGraph.selectMonthlySellerBoard");
		List<GraphVO> u_comment = sqlSession.selectList("mapper.adGraph.selectMonthlyUserComment");
		List<GraphVO> s_comment = sqlSession.selectList("mapper.adGraph.selectMonthlySellerComment");
		commuChartList.put("u_commuList", u_board);
		commuChartList.put("s_commuList", s_board);
		commuChartList.put("u_commentList", u_comment);
		commuChartList.put("s_commentList", s_comment);
		
		return commuChartList;
	}
}
