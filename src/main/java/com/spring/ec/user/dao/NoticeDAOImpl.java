package com.spring.ec.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.user.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectNoticeList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.notice.selectAllNoticeList", page);
		return noticeList;
	}

	@Override
	public List selectEventList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<NoticeVO> eventList = sqlSession.selectList("mapper.notice.selectAllEventList", page);
		return eventList;
	}

	@Override
	public NoticeVO selectNotice(int list_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.selectNotice", list_num);
	}

	@Override
	public void addNoticeHits(int list_num) throws DataAccessException {
		sqlSession.update("mapper.notice.addHits", list_num);
	}

	@Override
	public int noticePaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.selectNoticeCount");
	}

	@Override
	public int eventPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.selectEventCount");
	}
}
