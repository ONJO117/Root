package com.root.member.mapper;

import java.util.List;

import com.root.member.vo.LoginVO;
import com.root.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {

	public List<MemberVO> list(PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	public MemberVO view(String id) throws Exception;
	
	public int write(MemberVO vo) throws Exception;
	
	public int update(MemberVO vo) throws Exception;
	
	public int delete(MemberVO vo) throws Exception;
	
	public LoginVO login(LoginVO invo) throws Exception;
	
	public String idCheck(String id) throws Exception;
	
	public int changeStatus(MemberVO vo) throws Exception;

	public int changeGradeNo(MemberVO vo) throws Exception;
	
	public int changePhoto(MemberVO vo) throws Exception;
	
}
