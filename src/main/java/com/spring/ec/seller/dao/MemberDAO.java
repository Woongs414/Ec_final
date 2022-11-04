package com.spring.ec.seller.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.SellerVO;

public interface MemberDAO {
	public int insertMember(Map map) throws DataAccessException;
	
	public SellerVO loginById(SellerVO sellerVO) throws DataAccessException;
	
	public String find_id_result(SellerVO sellerVO)throws DataAccessException;
	
	public String find_pwd_result(SellerVO sellerVO)throws DataAccessException;
	/* public int emailCheck(String seller_email) throws Exception; */
}
