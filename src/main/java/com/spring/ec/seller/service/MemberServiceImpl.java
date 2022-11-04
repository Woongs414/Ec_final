package com.spring.ec.seller.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.MemberDAO;
import com.spring.ec.seller.vo.SellerVO;

@Service("sellerService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int addMember(Map map) throws DataAccessException {
		return memberDAO.insertMember(map);
	}
	
	@Override
	public SellerVO login(SellerVO sellerVO) throws DataAccessException {
		return memberDAO.loginById(sellerVO);
	}
	
	@Override
	public String find_id_result(SellerVO sellerVO)throws DataAccessException{
		return memberDAO.find_id_result(sellerVO);
	}
	
	@Override
	public String find_pwd_result(SellerVO sellerVO)throws DataAccessException{
		return memberDAO.find_pwd_result(sellerVO);
	}
	
	
	/*
	 * @Override public int emailCheck(String seller_email) throws Exception{ return
	 * memberDAO.emailCheck(seller_email); }
	 */


}
