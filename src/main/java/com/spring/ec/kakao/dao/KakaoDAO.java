package com.spring.ec.kakao.dao;

import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.spring.ec.kakao.vo.KakaoVO;
import com.spring.ec.user.vo.MemberVO;

public interface KakaoDAO {
	public void kakaoinsert(HashMap<String, Object> userInfo) throws DataAccessException;
	
	public MemberVO findkakao(HashMap<String, Object> userInfo) throws DataAccessException;
	
	/* public KakaoVO kakaoNumber(KakaoVO userInfo) throws DataAccessException; */
		
		
	
}
