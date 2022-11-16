package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface CateDAO {

	public List<SellerVO> selectAllStores() throws Exception;

	public List<SellerVO> selectSearchStores(Map<String, String> listMap) throws Exception;

	public List<SellerVO> selectsearcharea(String area) throws Exception;

	public StoreVO selectstoreInfo(String seller_id) throws Exception;

	public List<ProductVO> selectMenu() throws Exception;

	public List<ReviewVO> selectReview() throws Exception;

	public int updatereviewlike(int review_num) throws Exception;

	public String selectreviewlike(int review_num) throws Exception;

	public List<ReviewVO> selectReviewavgsum() throws Exception;

	public int addwish(Map<String, String> listMap) throws DataAccessException;

	public List<WishVO> selectwish(String user_id) throws Exception;

	public int delwish(Map<String, String> listMap) throws DataAccessException;

	public List selectwishsum() throws DataAccessException;

	public int addreview(ReviewVO review) throws DataAccessException;

	public List<ProductVO> selectprosum() throws Exception;

	public String selectsellerwishsum(String seller_id) throws DataAccessException;

	// ¿¹¾à
	public ReservVO selectStoreInfo2(String seller_id) throws DataAccessException;
	
	public int insertBooking(Map reserv) throws DataAccessException;
	
	public int insertNoUserBooking(Map reserv) throws DataAccessException;
}
