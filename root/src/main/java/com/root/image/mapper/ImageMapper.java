package com.root.image.mapper;

import java.util.List;

import com.root.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageMapper {

	public List<ImageVO> list(PageObject pageObject) throws Exception;

	public List<ImageVO> imageList(PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;

	public long imageTotalRow(PageObject pageObject) throws Exception;
	
	public ImageVO view(long no) throws Exception;

	public int changeImage(ImageVO vo) throws Exception;

	public int write(ImageVO vo) throws Exception;
	
	public int update(ImageVO vo) throws Exception;
	
	public int delete(long no) throws Exception;
	
}
