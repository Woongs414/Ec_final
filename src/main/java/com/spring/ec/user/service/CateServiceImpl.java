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

	//가게 리스트(store list)
	@Override
	public List<SellerVO> selectAllStores() throws Exception {
		List<SellerVO> StoreList = cateDAO.selectAllStores();
		return StoreList;
	}

	//가게 검색 리스트(store search list)
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

	//가게 상세 정보(Shop Details)
	@Override
	public StoreVO selectstoreInfo(String seller_id) throws Exception {
		StoreVO StoreList = cateDAO.selectstoreInfo(seller_id);
		return StoreList;
	}

	//가게 메뉴 리스트(store menu list)
	@Override
	public List<ProductVO> selectMenu() throws Exception {
		List<ProductVO> MenuList = cateDAO.selectMenu();
		return MenuList;
	}

	//가게 리뷰 리스트(store review list)
	@Override
	public List<ReviewVO> selectReview() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReview();
		return ReviewList;
	}

	//리뷰 좋아요 수정(update review like)
	@Override
	public int updatereviewlike(int reviewnum) throws Exception {
		return cateDAO.updatereviewlike(reviewnum);
	}

	//리뷰 좋아요 수(The number of likes for reviews)
	@Override
	public String selectreviewlike(int reviewnum) throws Exception {
		return cateDAO.selectreviewlike(reviewnum);
	}

	//리뷰 평균 별점, 리뷰 개수(Review Average Score, Review Count)
	@Override
	public List<ReviewVO> selectReviewavgsum() throws Exception {
		List<ReviewVO> ReviewList = cateDAO.selectReviewavgsum();
		return ReviewList;
	}

	//가게 상세정보2(Shop Details) - 예약
	@Override
	public ReservVO selectStoreInfo(String seller_id) throws Exception {
		return cateDAO.selectStoreInfo2(seller_id);
	}

	@Override
	public int addwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.addwish(listMap);
	}

	//해당 가게의 찜목록 (wish list)
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> WishList = cateDAO.selectwish(user_id);
		return WishList;
	}

	//찜 취소(delete wish)
	@Override
	public int delwish(Map<String, String> listMap) throws DataAccessException {
		return cateDAO.delwish(listMap);
	}

	//찜 개수(Total number of wishes)
	@Override
	public List selectwishsum() throws DataAccessException {
		return cateDAO.selectwishsum();
	}

	//리뷰 작성 (add review)
	@Override
	public int addreview(ReviewVO review) throws Exception {
		return cateDAO.addreview(review);
	}

	//메뉴 총 개수(Total number of menus)
	@Override
	public List selectprosum() throws Exception {
		return cateDAO.selectprosum();
	}

	// 찜 개수 (wish sum)
	@Override
	public String selectsellerwishsum(String seller_id) throws DataAccessException {
		return cateDAO.selectsellerwishsum(seller_id);
	}
	
	//회원 예약 (member reservation)
	@Override
	public int addBooking(Map booking) throws Exception{
		return cateDAO.insertBooking(booking);
	}
	
	//비회원 예약 (non-member reservation)
	@Override
	public int addNoUserBooking(Map booking) throws Exception{
		return cateDAO.insertNoUserBooking(booking);
	}
}
