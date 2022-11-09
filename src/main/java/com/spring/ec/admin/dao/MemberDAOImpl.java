package com.spring.ec.admin.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.admin.vo.MemberVO;

@Repository("amemberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	MemberVO memberVO;
	
	
	//관리자 로그인
	@Override
	public MemberVO adminlogin(MemberVO memberVO) throws DataAccessException{
		MemberVO admin = sqlSession.selectOne("mapper.admin.member.adminlogin", memberVO);
		return admin;
	}
	
	
	//admin list delete
	@Override
	public int deladmin(Map<String, Object> listMap) throws Exception {
		int deladmin = sqlSession.delete("mapper.admin.member.deladmin",listMap);
		return deladmin;
	}
	
}
