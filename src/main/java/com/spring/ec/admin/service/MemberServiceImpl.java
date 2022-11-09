package com.spring.ec.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.admin.dao.MemberDAO;
import com.spring.ec.admin.vo.MemberVO;

@Service("amemberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	//관리자 로그인
	@Override
	public MemberVO adminlogin(MemberVO memberVO) throws Exception{
		return memberDAO.adminlogin(memberVO);
	}
	
	//관리자 삭제
	@Override
	public int deladmin(Map<String, Object> listMap) throws Exception{
		return memberDAO.deladmin(listMap);
	}
	

	
}
