package com.root.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.root.board.mapper.BoardMapper;
import com.root.board.vo.BoardVO;
import com.root.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardService {

	@Inject
	private BoardMapper mapper;
	
	// 1. list
	public List<BoardVO> list(PageObject pageObject) throws Exception{
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("BoardService.list().pageObject - " + pageObject);
		return mapper.list(pageObject);
	}
	
	// 2. view
	public BoardVO view (long no, int inc) throws Exception {
		log.info("BoardService.view().no, inc - " + no + ", " + inc);
		if(inc == 1) mapper.increase(no);
		return mapper.view(no);
	}

	// 3. write
	public int write(BoardVO vo) throws Exception{
		log.info("BoardService.write().vo - " + vo);
		return mapper.write(vo);
	}
	
	// 4. update
	public int update(BoardVO vo)throws Exception{
		log.info("BoardService.update().vo - " + vo);
		return mapper.update(vo);
	}
	
	// 5. delete
	public int delete(BoardVO vo)throws Exception{
		return mapper.delete(vo);
	}

	public int replyInsert(ReplyVO vo)throws Exception{
		return mapper.replyInsert(vo);
	}

	public List<ReplyVO> replySelect(long no) throws Exception{
		return  mapper.replySelect(no);
	}

	public int replyRemove(ReplyVO vo) throws Exception {
		return mapper.replyRemove(vo);
	}
	
}
