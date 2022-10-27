package com.spring.ec.seller.dao;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.SellerVO;

public interface MemberDAO {
	public int insertMember(SellerVO sellerVO) throws DataAccessException;
	
	public SellerVO loginById(SellerVO sellerVO) throws DataAccessException;
	/* public int emailCheck(String seller_email) throws Exception; */
}
