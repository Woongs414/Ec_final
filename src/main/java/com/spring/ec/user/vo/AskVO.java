package com.spring.ec.user.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("askVO")
public class AskVO {

	private int ask_num;
	private String category_code;
	private String user_id;
	private String title;
	private String content;
	private char is_ans;
	private Date reg_date;
	private Date mod_date;
	
	public AskVO() {

	}

	public AskVO(int ask_num, String category_code,String user_id, String title,String content,char is_ans,Date reg_date,Date mod_date) {
		this.ask_num = ask_num;
		this.category_code= category_code;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.is_ans = is_ans;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
	}

	public int getAsk_num() {
		return ask_num;
	}

	public void setAsk_num(int ask_num) {
		this.ask_num = ask_num;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public char getIs_ans() {
		return is_ans;
	}

	public void setIs_ans(char is_ans) {
		this.is_ans = is_ans;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}



	

}