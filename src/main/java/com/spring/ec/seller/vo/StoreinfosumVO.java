package com.spring.ec.seller.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("storeinfosumVO")
public class StoreinfosumVO {

	private int storeInfo_num;
	private String seller_id;
	private String image_fileName;
	private String store_introduce;
	private String openTime;
	private String closeDay;
	private String store_nic;
	private String store_benefit;
	private Date reg_date;
	private Date mod_date;
	private String open_time;
	private String close_time;
	private int min_People;
	private int max_People;
	private int reserv_pay;
	private int wish_sum;
	private int review_sum;
	private int book_sum;

	
	
	public StoreinfosumVO() {

	}

	public StoreinfosumVO(int storeInfo_num, String seller_id,String image_fileName, String store_introduce,String openTime, String closeDay, String store_nic, String store_benefit, Date reg_date, Date mod_date, String open_time, String close_time, int min_People, int max_People, int reserv_pay, int wish_sum, int review_sum, int book_sum  ) {
		this.storeInfo_num = storeInfo_num;
		this.seller_id = seller_id;
		this.seller_id= seller_id;
		this.image_fileName = image_fileName;
		this.store_introduce = store_introduce;
		this.openTime = openTime;
		this.closeDay = closeDay;
		this.store_nic = store_nic;
		this.store_benefit = store_benefit;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.open_time = open_time;
		this.close_time = close_time;
		this.min_People = min_People;
		this.reserv_pay = reserv_pay;
		this.wish_sum = wish_sum;
		this.review_sum = review_sum;
		this.book_sum = book_sum;
		
		
	}

	public int getStoreInfo_num() {
		return storeInfo_num;
	}

	public void setStoreInfo_num(int storeInfo_num) {
		this.storeInfo_num = storeInfo_num;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}



	public String getImage_fileName() {
		return image_fileName;
	}

	public void setImage_fileName(String image_fileName) {
		this.image_fileName = image_fileName;
	}

	public String getStore_introduce() {
		return store_introduce;
	}

	public void setStore_introduce(String store_introduce) {
		this.store_introduce = store_introduce;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
	}

	public String getStore_nic() {
		return store_nic;
	}

	public void setStore_nic(String store_nic) {
		this.store_nic = store_nic;
	}

	public String getStore_benefit() {
		return store_benefit;
	}

	public void setStore_benefit(String store_benefit) {
		this.store_benefit = store_benefit;
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

	public String getOpen_time() {
		return open_time;
	}

	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}

	public String getClose_time() {
		return close_time;
	}

	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}

	public int getMin_People() {
		return min_People;
	}

	public void setMin_People(int min_People) {
		this.min_People = min_People;
	}

	public int getMax_People() {
		return max_People;
	}

	public void setMax_People(int max_People) {
		this.max_People = max_People;
	}

	public int getReserv_pay() {
		return reserv_pay;
	}

	public void setReserv_pay(int reserv_pay) {
		this.reserv_pay = reserv_pay;
	}

	public int getWish_sum() {
		return wish_sum;
	}

	public void setWish_sum(int wish_sum) {
		this.wish_sum = wish_sum;
	}


	public int getReview_sum() {
		return review_sum;
	}

	public void setReview_sum(int review_sum) {
		this.review_sum = review_sum;
	}

	public int getBook_sum() {
		return book_sum;
	}

	public void setBook_sum(int book_sum) {
		this.book_sum = book_sum;
	}




}