package com.spring.ec.seller.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("graphVO")
public class GraphVO {
	private String months;
	private int count;

	public GraphVO() {

	}

	public GraphVO(String months, int count) {
		this.months = months;
		this.count = count;
	}

	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

}
