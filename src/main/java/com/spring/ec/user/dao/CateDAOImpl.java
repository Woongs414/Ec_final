package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Repository("categoryDAO")
public class CateDAOImpl implements CateDAO {
	@Autowired
	private SqlSession sqlSession;

	//가게 리스트(store list)
	@Override
	public List<SellerVO> selectAllStores() throws Exception {
		List<SellerVO> articlesList = sqlSession.selectList("mapper.category.selectAllStores");
		return articlesList;
	}

	//가게 검색 리스트(store search list)
	@Override
	public List<SellerVO> selectSearchStores(Map<String, String> listMap) throws Exception {
		List<SellerVO> articlesList = sqlSession.selectList("mapper.category.selectSearchStores", listMap);
		return articlesList;
	}

	@Override
	public List<SellerVO> selectsearcharea(String area) throws Exception {
		List<SellerVO> articlesList = sqlSession.selectList("mapper.category.selectsearcharea", area);
		return articlesList;
	}

	//가게 상세 정보(Shop Details)
	@Override
	public StoreVO selectstoreInfo(String seller_id) throws Exception {
		StoreVO articlesList = sqlSession.selectOne("mapper.category.selectstoreInfo", seller_id);
		return articlesList;
	}

	//가게 메뉴 리스트(store menu list)
	@Override
	public List<ProductVO> selectMenu() throws Exception {
		List<ProductVO> articlesList = sqlSession.selectList("mapper.category.selectMenu");
		return articlesList;
	}

	//가게 리뷰 리스트(store review list)
	@Override
	public List<ReviewVO> selectReview() throws Exception {
		List<ReviewVO> articlesList = sqlSession.selectList("mapper.category.selectReview");
		return articlesList;
	}


	private int selectNewreviewnum() throws DataAccessException {
		return sqlSession.selectOne("mapper.user.selectNewreviewnum");
	}

	/* 리뷰등록 */
	//리뷰 작성 (add review)
	@Override
	public int addreview(ReviewVO review) throws DataAccessException {
		int result = sqlSession.insert("mapper.category.addreview", review);
		return result;
	}

	//메뉴 총 개수(Total number of menus)
	@Override
	public List<ProductVO> selectprosum() throws Exception {
		List<ProductVO> articlesList = sqlSession.selectList("mapper.category.selectprosum");
		return articlesList;
	}

	//리뷰 좋아요 수정(update review like)
	@Override
	public int updatereviewlike(int review_num) throws Exception {
		int result = sqlSession.update("mapper.category.updatereviewlike", review_num);
		return result;
	}

	//리뷰 좋아요 수(The number of likes for reviews)
	@Override
	public String selectreviewlike(int review_num) throws Exception {
		String result = sqlSession.selectOne("mapper.category.selectreviewlike", review_num);
		return result;
	}

	//리뷰 평균 별점, 리뷰 개수(Review Average Score, Review Count)
	@Override
	public List<ReviewVO> selectReviewavgsum() throws Exception {
		List<ReviewVO> articlesList = sqlSession.selectList("mapper.category.selectReviewavgsum");
		return articlesList;
	}

	@Override
	public int addwish(Map<String, String> listMap) throws DataAccessException {
		int result = sqlSession.insert("mapper.category.addwish", listMap);
		return result;
	}

	//찜 취소(delete wish)
	@Override
	public int delwish(Map<String, String> listMap) throws DataAccessException {
		int result = sqlSession.delete("mapper.category.delwish", listMap);
		return result;
	}

	//해당 가게의 찜목록 (wish list)
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> articlesList = sqlSession.selectList("mapper.category.selectwish", user_id);
		return articlesList;
	}

	/* 가게 별 찜개수 */
	@Override
	public List selectwishsum() throws DataAccessException {
		List result = sqlSession.selectList("mapper.category.selectwishsum");
		return result;
	}

	/* 조건 가게 찜개수 */
	// 찜 개수 (wish sum)
	@Override
	public String selectsellerwishsum(String seller_id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.category.selectsellerwishsum", seller_id);
		return result;
	}
	
	
// 예약

	//가게 상세정보2(Shop Details) - 예약
	@Override
	public ReservVO selectStoreInfo2(String seller_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.category.selectStoreInfo", seller_id);
	}
	
	//회원 예약 (member reservation)
	@Override
	public int insertBooking(Map reserv) throws DataAccessException {
		int book_num = sqlSession.selectOne("mapper.category.selectNewUserBook_num");
		reserv.put("book_num", book_num);
		return sqlSession.insert("mapper.category.insertUserBooking", reserv);
	}
	
	//비회원 예약 (non-member reservation)
	@Override
	public int insertNoUserBooking(Map reserv) throws DataAccessException {
		int book_num = sqlSession.selectOne("mapper.category.selectNewNoUserBook_num");
		reserv.put("book_num", book_num);
		return sqlSession.insert("mapper.category.insertNoUserBooking", reserv);
	}
}
