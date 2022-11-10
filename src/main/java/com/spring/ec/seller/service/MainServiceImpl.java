package com.spring.ec.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.common.visit.VisitVO;
import com.spring.ec.seller.dao.MainDAO;

@Service("sellerMainService")
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public void visitor(VisitVO vo)throws Exception{
		mainDAO.insertVisitor(vo);
	}
}
