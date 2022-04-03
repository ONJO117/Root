package com.root.member.vo;

import lombok.Data;

@Data
public class LoginVO {

	private String id, pw, name, photo, gradeName;
	private int gradeNo;
	private long newMessage;
}
