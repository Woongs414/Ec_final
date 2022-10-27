package com.spring.ec.seller.service;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.MemberVO;

public interface MemberService {
	
	public int addMember(SellerVO sellerVO) throws DataAccessException;
	
	public SellerVO login(SellerVO sellerVO) throws DataAccessException; 
	/* public int emailCheck(String seller_email) throws Exception; */
	

}
