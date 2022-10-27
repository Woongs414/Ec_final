package com.spring.ec.kakao.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.kakao.vo.KakaoVO;
import com.spring.ec.user.vo.MemberVO;

@Repository("kakaoDAO")
public class KakaoDAOImpl implements KakaoDAO {
	
	//mapper를 호출하기 위한 클래스 주입.
	@Autowired
	private SqlSession sqlSession;
	
	//정보 저장
	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) throws DataAccessException{
		sqlSession.insert("mapper.member.kakaoInsert",userInfo);
	}
	//정보 확인
	@Override
	public MemberVO findkakao(HashMap<String, Object> userInfo) throws DataAccessException {
		
		System.out.println("ID: " + userInfo.get("user_id"));
		System.out.println("RN: " + userInfo.get("user_name"));
		System.out.println("RE: " + userInfo.get("user_email"));
//		System.out.println("mm: " + userInfo.get("birth_mm"));
//		System.out.println("dd: " + userInfo.get("birth_dd"));
//		System.out.println("RG: " + userInfo.get("gender"));
//		
		
		return sqlSession.selectOne("mapper.member.findKakao", userInfo);
	}
	
//	@Override
//	public KakaoVO kakaoNumber(KakaoVO userInfo) {
//		return sqlSession.selectOne("mapper.member.kakaoNumber", userInfo);
//	}
	
}



