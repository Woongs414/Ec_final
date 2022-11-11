package com.spring.ec.seller.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

public interface InfoService {
	public List<ProductVO> selectMenu(Map<String, Object> listMap) throws Exception;
	public List<ProductVO> selectsearchMenu(Map<String, Object> listMap) throws Exception;
	public int deletemenu(Map<String, Object> listMap) throws Exception;
	public ProductVO menudetail(Map<String, String> listMap) throws Exception;
	public StoreinfosumVO selectinfosum(String seller_id) throws Exception;
	public int delonemenu(Map<String, Object> listMap) throws Exception;
	public int modProduct(Map<String, Object> menuMap) throws Exception;
	public int menumadd(Map<String, Object> menuMap) throws Exception;
	public int selectmenucount(String seller_id) throws Exception;
	public int searchmenucount(Map<String, Object> listMap) throws Exception;
}