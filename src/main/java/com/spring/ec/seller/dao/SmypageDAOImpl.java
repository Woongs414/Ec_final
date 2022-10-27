package com.spring.ec.seller.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

@Repository("smypageDAO")
public class SmypageDAOImpl implements SmypageDAO {
	@Autowired
	private SqlSession sqlSession;


	//pwd check
	@Override
	public int checkuser(Map<String, Object> listMap) throws Exception {
		int checkuser = sqlSession.selectOne("mapper.seller.mypage.checkuser",listMap);
		return checkuser;
	}
	
	//select seller info
	@Override
	public SellerVO sellerinfo(String seller_id) throws Exception {
		SellerVO sellerinfo = sqlSession.selectOne("mapper.seller.mypage.sellerinfo",seller_id);
		return sellerinfo;
	}
	
	//select seller detail info
	@Override
	public StoreinfosumVO sellerdetail(String seller_id) throws Exception {
		StoreinfosumVO sellerdetail = sqlSession.selectOne("mapper.seller.mypage.sellerdetail",seller_id);
		return sellerdetail;
	}
	
	
	//pwd change
	@Override
	public int changepwd(Map<String, Object> listMap) throws Exception {
		int changepwd = sqlSession.update("mapper.seller.mypage.changepwd",listMap);
		return changepwd;
	}
	
	
	//mod info
	@Override
	public int modseller(SellerVO modinfo) throws Exception {
		int info = sqlSession.update("mapper.seller.mypage.modseller",modinfo);
		return info;
	}
	
	//mod seller
	@Override
	public int modinfo(Map<String, Object> modinfoMap) throws Exception {
		int info = sqlSession.update("mapper.seller.mypage.modinfo",modinfoMap);
		return info;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}