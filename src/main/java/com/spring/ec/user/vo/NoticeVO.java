package com.spring.ec.user.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int list_num;
	private String category_code;
	private String user_id;
	private String image_fileName;
	private String no_title;
	private String no_content;
	private int hits;
	private Date reg_date;
	private Date mod_date;
	
	public NoticeVO() {
		
	}
	
	public NoticeVO(int list_num, String category_code, String user_id, String no_title, String no_content, String image_fileName, int hits, Date reg_date, Date mod_date ) {
		this.list_num = list_num;
		this.category_code = category_code;
		this.user_id = user_id;
		this.no_content = no_content;
		this.no_title = no_title;
		this.image_fileName = image_fileName;
		this.hits = hits;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		
	}

	public int getList_num() {
		return list_num;
	}

	public void setList_num(int list_num) {
		this.list_num = list_num;
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

	public String getImage_fileName() {
		return image_fileName;
	}

	public void setImage_fileName(String image_fileName) {
		this.image_fileName = image_fileName;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public String getNo_content() {
		return no_content;
	}

	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
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
