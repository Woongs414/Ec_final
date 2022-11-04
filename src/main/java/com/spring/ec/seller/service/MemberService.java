package com.spring.ec.seller.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.SellerVO;

public interface MemberService {
	
	public int addMember(Map map) throws DataAccessException;
	
	public SellerVO login(SellerVO sellerVO) throws DataAccessException; 
	
	public String find_id_result(SellerVO sellerVO)throws DataAccessException;
	
	public String find_pwd_result(SellerVO sellerVO)throws DataAccessException;
	
	/* public int emailCheck(String seller_email) throws Exception; */
	

}
