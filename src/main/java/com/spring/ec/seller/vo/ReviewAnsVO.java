package com.spring.ec.seller.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("sellerReviewAnsVO")
public class ReviewAnsVO {
	private int re_ans_num;
	private int review_num;
	private String seller_id;
	private String user_id;
	private String content;
	private int rating;
	private int liked;
	private String user_nick;
	private String re_ans_content;
	private Date reg_date;
	private Date mod_date;
	private Date ans_reg_date;
	private Date ans_mod_date;
	private float rating_percent;
	
	public ReviewAnsVO() {
	}
	
	public ReviewAnsVO(int re_ans_num, int review_num, String seller_id,String user_id, String content, int rating, int liked, 
			String user_nick, String re_ans_content, Date reg_date, Date mod_date, Date ans_reg_date,
			Date ans_mod_date,float rating_percent) {
		this.re_ans_num = re_ans_num;
		this.review_num = review_num;
		this.seller_id = seller_id;
		this.user_id = user_id;
		this.content = content;
		this.rating = rating;
		this.liked = liked;
		this.user_nick = user_nick;
		this.re_ans_content = re_ans_content;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.ans_reg_date = ans_reg_date;
		this.ans_mod_date = ans_mod_date;
		this.rating_percent = rating_percent;
	}

	public float getRating_percent() {
		return rating_percent;
	}

	public void setRating_percent(float rating_percent) {
		this.rating_percent = rating_percent;
	}

	public int getRe_ans_num() {
		return re_ans_num;
	}

	public void setRe_ans_num(int re_ans_num) {
		this.re_ans_num = re_ans_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getRe_ans_content() {
		return re_ans_content;
	}

	public void setRe_ans_content(String re_ans_content) {
		this.re_ans_content = re_ans_content;
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

	public Date getAns_reg_date() {
		return ans_reg_date;
	}

	public void setAns_reg_date(Date ans_reg_date) {
		this.ans_reg_date = ans_reg_date;
	}

	public Date getAns_mod_date() {
		return ans_mod_date;
	}

	public void setAns_mod_date(Date ans_mod_date) {
		this.ans_mod_date = ans_mod_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
}
