package com.spring.ec.admin.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ec.admin.vo.MemberVO;

public interface AdminmagDAO {
	public List<MemberVO> selectadminlist(int page) throws DataAccessException;
	public int selectadmincount() throws DataAccessException;
}
