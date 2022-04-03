package com.root.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.root.image.mapper.ImageMapper;
import com.root.image.vo.ImageVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("ImageService")
public class ImageService {
	
	@Inject
	private ImageMapper mapper;
	
	public List<ImageVO> list(PageObject pageObject) throws Exception{
		log.info("ImageService pageObject : " + pageObject);
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	public List<ImageVO> imageList(PageObject pageObject) throws Exception{
		log.info("ImageService pageObject : " + pageObject);
		
		pageObject.setTotalRow(mapper.imageTotalRow(pageObject));
		return mapper.imageList(pageObject);
	}
	
	public ImageVO view(long no) throws Exception{
		log.info("ImageService.view().no "  + no);
		
		return mapper.view(no);
	}
	
	public int changeImage(ImageVO vo) throws Exception{
		log.info("ImageService.changeImage().vo "  + vo);
		
		return mapper.changeImage(vo);
	}
	
	public int write(ImageVO vo) throws Exception{
		log.info("ImageService.write().vo "  + vo);
		
		return mapper.write(vo);
	}
	
	public int update(ImageVO vo) throws Exception{
		log.info("ImageService.update().vo "  + vo);
		
		return mapper.update(vo);
	}
	
	public int delete(long no) throws Exception{
		log.info("ImageService.delete().no "  + no);
		
		return mapper.delete(no);
	}
	
	
	
}
