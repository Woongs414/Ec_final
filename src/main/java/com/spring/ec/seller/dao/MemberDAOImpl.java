package com.spring.ec.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.user.vo.MemberVO;

@Repository("sellerMemberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	// 회원가입
		@Override
		public int insertMember(SellerVO sellerVO) throws DataAccessException {
			int result = sqlSession.insert("mapper.seller.insertSellerMember", sellerVO);
			return result;
		}
		
		// 로그인
		@Override
		public SellerVO loginById(SellerVO sellerVO) throws DataAccessException {
			SellerVO vo = sqlSession.selectOne("mapper.seller.loginById", sellerVO);
			return vo;
		}
		
		/*
		 * @Override public int emailCheck(String seller_email) throws Exception{ return
		 * sqlSession.selectOne("mapper.seller.emailCheck", seller_email); }
		 */
}
