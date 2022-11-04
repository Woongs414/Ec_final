package com.spring.ec.seller.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.SellerVO;

@Repository("sellerMemberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	// 회원가입
		@Override
		public int insertMember(Map map) throws DataAccessException {
			int result = sqlSession.insert("mapper.seller.insertSellerMember", map);
			return result;
		}
		
		// 로그인
		@Override
		public SellerVO loginById(SellerVO sellerVO) throws DataAccessException {
			SellerVO vo = sqlSession.selectOne("mapper.seller.loginById", sellerVO);
			return vo;
		}
		
		@Override
		public String find_id_result(SellerVO sellerVO)throws DataAccessException{
			String vo = sqlSession.selectOne("mapper.seller.Seller_find_id_result", sellerVO);
			return vo;
		}
		
		@Override
		public String find_pwd_result(SellerVO sellerVO)throws DataAccessException{
			String vo = sqlSession.selectOne("mapper.seller.Seller_find_pwd_result", sellerVO);
			return vo;
		}
		
		
		/*
		 * @Override public int emailCheck(String seller_email) throws Exception{ return
		 * sqlSession.selectOne("mapper.seller.emailCheck", seller_email); }
		 */
}
