package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.dao.CateDAO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Service("categoryService")
public class CateServiceImpl implements CateService {
	@Autowired
	CateDAO cateDAO;

	@Override
	public List<SellerVO> selectAllStores() throws Exception {
		List<SellerVO> StoreList = cateDAO.selectAllStores();
		return StoreList;
	}

	@Override
	public List<SellerVO> selectSearchStores(Map<String, String> listMap) throws Exception {
		List<SellerVO> StoreList = cateDAO.selectSearchStores(listMap);
		return StoreList;
	}

	@Override
	public List<SellerVO> selectsearcharea(String area) throws Exception {
		List<SellerVO> StoreList = cateDAO.selectsearcharea(area);
		return StoreList;
	}

	@Override
	public StoreVO selectstoreInfo(String seller_id) throws Exception {
		StoreVO StoreList = cateDAO.selectstoreInfo(seller_id);
		return StoreList;
	}

	@Override
	public List<ProductVO> selectMenu() throws Exception {
		List<ProductVO> MenuList = cateDAO.selectMenu();
		return MenuList;
	}

	@Override
	public List<ReviewVO> selectReview() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReview();
		return ReviewList;
	}

	@Override
	public int updatereviewlike(int reviewnum) throws Exception {
		return cateDAO.updatereviewlike(reviewnum);
	}

	@Override
	public String selectreviewlike(int reviewnum) throws Exception {
		return cateDAO.selectreviewlike(reviewnum);
	}

	@Override
	public List<ReviewVO> selectReviewavgsum() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReviewavgsum();
		return ReviewList;
	}

	@Override
	public ReservVO selectStoreInfo(String seller_id) throws Exception {
		return cateDAO.selectStoreInfo2(seller_id);
	}

	@Override
	public int addwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.addwish(listMap);
	}

	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> WishList = cateDAO.selectwish(user_id);
		return WishList;
	}

	@Override
	public int delwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.delwish(listMap);
	}

	@Override
	public List selectwishsum() throws DataAccessException {
		return cateDAO.selectwishsum();
	}

	@Override
	public int addreview(ReviewVO review) throws Exception {
		return cateDAO.addreview(review);
	}

	@Override
	public List selectprosum() throws Exception {
		return cateDAO.selectprosum();
	}

	@Override
	public String selectsellerwishsum(String seller_id) throws DataAccessException {
		return cateDAO.selectsellerwishsum(seller_id);
	}
	
	@Override
	public int addBooking(Map booking) throws Exception{
		return cateDAO.insertBooking(booking);
	}
	@Override
	public int addNoUserBooking(Map booking) throws Exception{
		return cateDAO.insertNoUserBooking(booking);
	}
}
