package com.root.image.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {

	private long no;
	private String title, content, id, name, fileName, deleteImage;
	private Date writeDate;
	private MultipartFile image;
	
}
