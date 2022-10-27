package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.seller.vo.StoreinfosumVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface InfoDAO {

	public List<ProductVO> selectMenu(String seller_id) throws Exception;
	public List<ProductVO> selectsearchMenu(Map<String, String> listMap) throws Exception;
	public int deletemenu(Map<String, Object> listMap) throws Exception;
	public ProductVO menudetail(Map<String, String> listMap) throws Exception;
	public StoreinfosumVO selectinfosum(String seller_id) throws Exception;
	public int delonemenu(Map<String, Object> listMap) throws Exception;
	public int modProduct(Map<String, Object> menuMap) throws Exception;
	public int menumadd(Map<String, Object> menuMap) throws Exception;
}