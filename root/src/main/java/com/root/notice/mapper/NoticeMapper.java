package com.root.notice.mapper;

import java.util.List;

import com.root.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeMapper {

	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	
	public List<NoticeVO> noticeList(PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;

	public long noticeTotalRow(PageObject pageObject) throws Exception;
	
	public NoticeVO view(long no) throws Exception;
	
	public int write(NoticeVO vo) throws Exception;
	
	public int update(NoticeVO vo) throws Exception;

	public int delete(long no) throws Exception;

}
