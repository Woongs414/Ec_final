package com.spring.ec.admin.service;

import java.util.List;

import com.spring.ec.admin.vo.MemberVO;

public interface AdminmagService {
	public List<MemberVO> selectadminlist(int page) throws Exception;
	public int selectadmincount() throws Exception;
}
