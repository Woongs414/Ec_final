package com.spring.ec.seller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.dao.InfoDAO;
import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.StoreinfosumVO;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	@Autowired
	InfoDAO infoDAO;

	//product(menu) list select
	@Override
	public List<ProductVO> selectMenu(Map<String, Object> listMap) throws Exception {
		return infoDAO.selectMenu(listMap);
	}
	
	
	//product(menu) search select
	@Override
	public List<ProductVO> 	selectsearchMenu(Map<String, Object> listMap) throws Exception {
		return infoDAO.selectsearchMenu(listMap);
	}
	
	//product(menu) list delete
	@Override
	public int deletemenu(Map<String, Object> listMap) throws Exception {
		return infoDAO.deletemenu(listMap);
	}
	
	//product(menu) one delete
	@Override
	public int delonemenu(Map<String, Object> listMap) throws Exception {
		return infoDAO.delonemenu(listMap);
	}
	
	
	
	//product(menu) detail
	@Override
	public ProductVO menudetail(Map<String, String> listMap) throws Exception {
		return infoDAO.menudetail(listMap);
	}
	
	
	//storeinfo
	@Override
	public StoreinfosumVO selectinfosum(String seller_id) throws Exception {
		return infoDAO.selectinfosum(seller_id);
	}
	
	
	//product(menu) mod
	@Override
	public int modProduct(Map<String, Object> menuMap) throws Exception {
		return infoDAO.modProduct(menuMap);
	}
	
	
	//product(menu) add
	@Override
	public int menumadd(Map<String, Object> menuMap) throws Exception {
		return infoDAO.menumadd(menuMap);
	}
	
	
	
	
	
	//product(menu) list count
	@Override
	public int selectmenucount(String seller_id) throws Exception {
		return infoDAO.selectmenucount(seller_id);
	}
	
	//product(menu) search list count
	@Override
	public int searchmenucount(Map<String, Object> listMap) throws Exception {
		return infoDAO.searchmenucount(listMap);
	}
	
	
	
	
	
/*	

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
*/

}