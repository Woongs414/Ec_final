package com.spring.ec.user.dao;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.MemberVO;

public interface MemberDAO {

	// ����� �α���
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	// ȸ������
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	
	public int idCheck(String user_id)throws Exception ;
	// ��й�ȣ ã��
	
	public int nickCheck(String user_nick)throws Exception ;
	
	public int emailCheck(String user_email)throws Exception ;
	
	public int mobileCheck(String mobile)throws Exception ;
	
	public String find_pwd_Result(MemberVO memberVO) throws DataAccessException;

	// ���̵� ã��
	public String find_id_Result(MemberVO memberVO) throws DataAccessException;
	// ��������/�̺�Ʈ

}