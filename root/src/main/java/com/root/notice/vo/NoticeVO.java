package com.root.notice.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeVO {

	private long no;
	private String title, content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate, endDate, updateDate, writeDate;

	
}
