package com.spring.ec.admin.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.admin.vo.MemberVO;

public interface MemberDAO {
	public MemberVO adminlogin(MemberVO memberVO) throws DataAccessException;
	public int deladmin(Map<String, Object> listMap) throws Exception;
}
