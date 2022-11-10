package com.spring.ec.admin.service;

import java.util.Map;

public interface MainService {
	public Map<String, Object> userChartList()throws Exception;
	
	public Map<String, Object> sellerChartList()throws Exception;
	
	public Map<String, Object> commuChartList()throws Exception;
}
