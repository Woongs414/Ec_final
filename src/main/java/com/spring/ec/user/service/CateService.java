package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface CateService {
	public List<SellerVO> selectAllStores() throws Exception;

	public List<SellerVO> selectSearchStores(Map<String, String> listMap) throws Exception;

	public List<SellerVO> selectsearcharea(String area) throws Exception;

	public StoreVO selectstoreInfo(String seller_id) throws Exception;

	public List<ProductVO> selectMenu() throws Exception;

	public List<ReviewVO> selectReview() throws Exception;

	public int updatereviewlike(int reviewnum) throws Exception;

	public String selectreviewlike(int reviewnum) throws Exception;

	public List<ReviewVO> selectReviewavgsum() throws Exception;

	public int addwish(Map<String, String> listMap) throws DataAccessException;

	public List<WishVO> selectwish(String user_id) throws Exception;

	public int delwish(Map<String, String> listMap) throws DataAccessException;

	public List selectwishsum() throws DataAccessException;
	
	public ReservVO selectStoreInfo(String seller_id) throws Exception;
	
	public int addreview(ReviewVO review) throws Exception;
	
	public List selectprosum() throws Exception;
	
	public String selectsellerwishsum(String seller_id) throws DataAccessException;
	
	public int addBooking(Map booking) throws Exception;
	
	public int addNoUserBooking(Map booking) throws Exception;
}
