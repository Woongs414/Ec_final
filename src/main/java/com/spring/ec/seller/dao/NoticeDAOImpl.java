package com.spring.ec.seller.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.user.vo.NoticeVO;

@Repository("sellerNoticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectSellerNoticeList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.notice.selectAllSellerNoticeList", page);
		return noticeList;
	}
	@Override
	public List selectSellerMainNoticeList(int page) throws DataAccessException {
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.notice.selectSellerNoticeList", page);
		return noticeList;
	}
	@Override
	public NoticeVO selectSellerNotice(int list_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.selectNotice", list_num);
	}

	@Override
	public void s_addNoticeHits(int list_num) throws DataAccessException {
		sqlSession.update("mapper.notice.addHits", list_num);
	}

	@Override
	public int sellerNoticePaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.selectSellerNoticeCount");
	}
}
