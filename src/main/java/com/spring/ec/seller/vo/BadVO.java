package com.spring.ec.seller.vo;

import org.springframework.stereotype.Component;

@Component("s_badVO")
public class BadVO {
	private int bad_num;
	private String seller_id;
	private int list_num;
	private int bad;

public BadVO() {
	
}

public BadVO(int bad_num, String seller_id, int list_num, int bad) {
	this.bad_num = bad_num;
	this.seller_id = seller_id;
	this.list_num = list_num;
	this.bad = bad;
}

public int getBad_num() {
	return bad_num;
}

public void setBad_num(int bad_num) {
	this.bad_num = bad_num;
}

public String getSeller_id() {
	return seller_id;
}

public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
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
