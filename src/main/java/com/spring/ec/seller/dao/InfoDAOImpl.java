package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

@Repository("infoDAO")
public class InfoDAOImpl implements InfoDAO {
	@Autowired
	private SqlSession sqlSession;

	//menu select
	@Override
	public List<ProductVO> selectMenu(String seller_id) throws Exception {
		List<ProductVO> articlesList = sqlSession.selectList("mapper.seller.menu.selectMenu",seller_id);
		return articlesList;
	}
	
	//menu search select
	@Override
	public List<ProductVO> selectsearchMenu(Map<String, String> listMap) throws Exception {
		List<ProductVO> articlesList = sqlSession.selectList("mapper.seller.menu.selectsearchMenu",listMap);
		return articlesList;
	}
	
	//menu list delete
	@Override
	public int deletemenu(Map<String, Object> listMap) throws Exception {
		int deletemenu = sqlSession.delete("mapper.seller.menu.deletemenu",listMap);
		return deletemenu;
	}
	
	//menu one delete
	@Override
	public int delonemenu(Map<String, Object> listMap) throws Exception {
		int delonemenu = sqlSession.delete("mapper.seller.menu.delonemenu",listMap);
		return delonemenu;
	}
	
	
	
	
	//menu detail
	@Override
	public ProductVO menudetail(Map<String, String> listMap) throws Exception {
		ProductVO deletemenu = sqlSession.selectOne("mapper.seller.menu.menudetail",listMap);
		return deletemenu;
	}
	
	//store info
	@Override
	public StoreinfosumVO selectinfosum(String seller_id) throws Exception {
		StoreinfosumVO selectinfosum = sqlSession.selectOne("mapper.seller.menu.selectinfosum",seller_id);
		return selectinfosum;
	}
	
	//menu mod
	@Override
	public int modProduct(Map<String, Object> menuMap) throws Exception {
		int modProduct = sqlSession.update("mapper.seller.menu.modProduct",menuMap);
		return modProduct;
	}
	
	//menu add
	@Override
	public int menumadd(Map<String, Object> menuMap) throws Exception {
		int menumadd = sqlSession.insert("mapper.seller.menu.menumadd",menuMap);
		return menumadd;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}