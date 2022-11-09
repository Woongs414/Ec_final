package com.spring.ec.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.admin.vo.MemberVO;

@Repository("adminmagDAO")
public class AdminmagDAOImpl implements AdminmagDAO {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	MemberVO memberVO;
	
	
	//관리자 로그인
	@Override
	public List<MemberVO> selectadminlist(int page) throws DataAccessException{
		page = (page - 1) * 10;
		List<MemberVO> vo = sqlSession.selectList("mapper.admin.member.selectadminlist", page);
		return vo;
	}
	
	//관리자 수
	@Override
	public int selectadmincount() throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.member.selectadmincount");
	}


	
	
	
	
}
