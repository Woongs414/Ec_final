package com.spring.ec.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.common.visit.VisitVO;

@Repository("sellerMainDAO")
public class MainDAOImpl implements MainDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertVisitor(VisitVO vo) throws DataAccessException{
		sqlSession.insert("mapper.visit.insertVisitor", vo);
	}
}
