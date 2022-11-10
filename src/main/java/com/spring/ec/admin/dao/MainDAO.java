package com.spring.ec.admin.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MainDAO {
	public Map<String, Object> selectMonthlyUserChart()throws DataAccessException;
	
	public Map<String, Object> selectMonthlySellerChart()throws DataAccessException;
	
	public Map<String, Object> selectMonthlyCommuChart()throws DataAccessException;
}
