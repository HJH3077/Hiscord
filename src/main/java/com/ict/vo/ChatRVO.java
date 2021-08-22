package com.ict.vo;

import org.springframework.web.multipart.MultipartFile;

public class ChatRVO {
	private String room_id, room_name, chat_user, room_logo;
	private MultipartFile r_logo;
	
	public MultipartFile getR_logo() {
		return r_logo;
	}

	public void setR_logo(MultipartFile r_logo) {
		this.r_logo = r_logo;
	}

	// getter / setter
	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getChat_user() {
		return chat_user;
	}

	public void setChat_user(String chat_user) {
		this.chat_user = chat_user;
	}

	public String getRoom_logo() {
		return room_logo;
	}

	public void setRoom_logo(String room_logo) {
		this.room_logo = room_logo;
	}
	
}
