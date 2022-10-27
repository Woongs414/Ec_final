package com.spring.ec.user.vo;

import org.springframework.stereotype.Component;

@Component("badVO")
public class BadVO {
	private int bad_num;
	private String user_id;
	private int list_num;
	private int bad;
	
	public BadVO() {
		
	}
	public BadVO(int bad_num, String user_id, int list_num, int bad) {
		this.bad_num = bad_num;
		this.user_id = user_id;
		this.list_num = list_num;
		this.bad = bad;
	}
	public int getBad_num() {
		return bad_num;
	}
	public void setBad_num(int bad_num) {
		this.bad_num = bad_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	
}
