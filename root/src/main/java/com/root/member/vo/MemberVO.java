package com.root.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {

	private String id, pw, name, gender, tel, email, status, photo, gradeName, deletePhoto;
	private int gradeNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth, regDate, conDate;
	private MultipartFile photoFile;
}
