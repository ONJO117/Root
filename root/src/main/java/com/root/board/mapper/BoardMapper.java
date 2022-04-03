package com.root.board.mapper;

import java.util.List;

import com.root.board.vo.BoardVO;
import com.root.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface BoardMapper {

	// 1-1. 리스트
	public List<BoardVO> list(PageObject pageObject) throws Exception;
	// 1-2. 전체 데이터 갯수
	public long getTotalRow(PageObject pageObject) throws Exception;
	// 2-1. 보기
	public BoardVO view(long no) throws Exception;
	// 2-2. 조회수 1증가
	public int increase(long no) throws Exception;
	// 3. 글쓰기
	public int write(BoardVO vo) throws Exception;
	// 4. 수정
	public int update(BoardVO vo) throws Exception;
	// 5. 삭제
	public int delete(BoardVO vo) throws Exception;
	
	public int replyInsert(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> replySelect(long no) throws Exception;
	
	public int replyRemove(ReplyVO vo) throws Exception;
	
}
