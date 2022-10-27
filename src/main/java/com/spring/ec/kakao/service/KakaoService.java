package com.spring.ec.kakao.service;

import com.spring.ec.user.vo.MemberVO;

public interface KakaoService {
	public MemberVO getUserInfo(String access_Token) throws Exception;

	public String getAccessToken(String authorize_code) throws Exception;
	
//	public KakaoVO kakaoNumber(KakaoVO userInfo) throws Exception;
}
