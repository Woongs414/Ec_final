package com.spring.ec.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.MemberDAO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.MemberVO;

@Service("sellerService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int addMember(SellerVO sellerVO) throws DataAccessException {
		return memberDAO.insertMember(sellerVO);
	}
	
	@Override
	public SellerVO login(SellerVO sellerVO) throws DataAccessException {
		return memberDAO.loginById(sellerVO);
	}
	/*
	 * @Override public int emailCheck(String seller_email) throws Exception{ return
	 * memberDAO.emailCheck(seller_email); }
	 */


}
