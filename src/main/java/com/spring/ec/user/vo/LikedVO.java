package com.spring.ec.user.vo;

import org.springframework.stereotype.Component;

@Component("likedVO")
public class LikedVO {
	private int liked_num;
	private String user_id;
	private int list_num;
	private int liked;
	
	public LikedVO() {
		
	}
	
	public LikedVO(int liked_num, String user_id, int list_num, int liked) {
		this.liked_num = liked_num;
		this.user_id = user_id;
		this.list_num = list_num;
		this.liked = liked;
	}

	public int getLiked_num() {
		return liked_num;
	}

	public void setLiked_num(int liked_num) {
		this.liked_num = liked_num;
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

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}
	
}
