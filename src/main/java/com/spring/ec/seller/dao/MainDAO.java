package com.spring.ec.seller.dao;

import org.springframework.dao.DataAccessException;

import com.spring.ec.common.visit.VisitVO;

public interface MainDAO {
	public void insertVisitor(VisitVO vo) throws DataAccessException;
}
