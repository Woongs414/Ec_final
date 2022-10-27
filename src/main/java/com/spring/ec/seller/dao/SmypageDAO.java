package com.spring.ec.seller.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.seller.vo.StoreinfosumVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface SmypageDAO {

	public int checkuser(Map<String, Object> listMap) throws Exception;
	public SellerVO sellerinfo(String seller_id) throws Exception;
	public int changepwd(Map<String, Object> listMap) throws Exception;
	public StoreinfosumVO sellerdetail(String seller_id) throws Exception;
	public int modseller(SellerVO modinfo) throws Exception;
	public int modinfo(Map<String, Object> modinfoMap) throws Exception;
}