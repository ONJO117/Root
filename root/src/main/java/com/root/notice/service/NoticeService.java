package com.root.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.root.notice.mapper.NoticeMapper;
import com.root.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("NoticeService")
public class NoticeService {

	@Inject
	private NoticeMapper mapper;
	
	public List<NoticeVO> list(PageObject pageObject) throws Exception{
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("NoticeService.list().pageObject - " + pageObject);
		
		return mapper.list(pageObject);
	}
	public List<NoticeVO> noticeList(PageObject pageObject) throws Exception{
		pageObject.setTotalRow(mapper.noticeTotalRow(pageObject));
		log.info("NoticeService.noticeList().pageObject - " + pageObject);
		
		return mapper.noticeList(pageObject);
	}
	
	public NoticeVO view(long no) throws Exception{
		log.info("NoticeService.view().no - " + no);

		return mapper.view(no);
	}
	
	public int write(NoticeVO vo) throws Exception{
		log.info("NoticeService.wriet().vo - " + vo);
		
		return mapper.write(vo);
	}

	public int update(NoticeVO vo) throws Exception{
		log.info("NoticeService.update().vo - " + vo);
		
		return mapper.update(vo);
	}

	public int delete(long no) throws Exception{
		log.info("NoticeService.delete().no- " + no);
		
		return mapper.delete(no);
	}
	
	
}
