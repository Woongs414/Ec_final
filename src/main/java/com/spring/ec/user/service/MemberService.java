package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.NoticeVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MemberService {
	//ȸ������
	public int addMember(MemberVO memberVO) throws DataAccessException; 
	//�α���
	public MemberVO login(MemberVO member)throws DataAccessException;
	
	public int idCheck(String user_id) throws Exception;
	//��й�ȣ ã��
	public int nickCheck(String user_nick) throws Exception;
	
	public int emailCheck(String user_email) throws Exception;
	
	public int mobileCheck(String mobile) throws Exception;
	
	public String find_pwd_Result(MemberVO member) throws DataAccessException;
	//���̵� ã��
	public String find_id_Result(MemberVO member) throws DataAccessException;

}