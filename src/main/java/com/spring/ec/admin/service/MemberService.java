package com.spring.ec.admin.service;

import java.util.Map;

import com.spring.ec.admin.vo.MemberVO;

public interface MemberService {
	public MemberVO adminlogin(MemberVO memberVO) throws Exception;
	public int deladmin(Map<String, Object> listMap) throws Exception;

}
