package com.spring.ec.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.admin.dao.MainDAO;
import com.spring.ec.seller.vo.GraphVO;

@Service("adminMainService")
public class MainServiceImpl implements MainService {
	@Autowired
	MainDAO mainDAO;
	//사용자 그래프
	@Override
	public Map<String, Object> userChartList()throws Exception{
		return mainDAO.selectMonthlyUserChart();
	}
	//판매자 그래프
	@Override
	public Map<String, Object> sellerChartList()throws Exception{
		return mainDAO.selectMonthlySellerChart();
	}
	//게시판 그래프
	@Override
	public Map<String, Object> commuChartList()throws Exception{
		return mainDAO.selectMonthlyCommuChart();
	}
	
	
	
}
