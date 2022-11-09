package com.spring.ec.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.admin.dao.AdminmagDAO;
import com.spring.ec.admin.vo.MemberVO;

@Service("adminmagService")
public class AdminmagServiceImpl implements AdminmagService {
	@Autowired
	AdminmagDAO adminmagDAO;
	

	
	//관리자 리스트
	@Override
	public List<MemberVO> selectadminlist(int page) throws Exception{
		return adminmagDAO.selectadminlist(page);
	}
	
	//관리자 수
	@Override
	public int selectadmincount() throws Exception{
		return adminmagDAO.selectadmincount();
	}
	
	
	
	
	
}
