package com.root.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.root.member.mapper.MemberMapper;
import com.root.member.vo.LoginVO;
import com.root.member.vo.MemberVO;
import com.webjjang.util.PageObject;

@Service
public class MemberService {

	@Inject
	private MemberMapper mapper;
	
	public List<MemberVO> list(PageObject pageObject) throws Exception{
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}
	
	public MemberVO view (String id)  throws Exception {

		return mapper.view(id);
	}
	public int changePhoto (MemberVO vo)  throws Exception {
		
		return mapper.changePhoto(vo);
	}

	public int update(MemberVO vo)  throws Exception {
		
		return mapper.update(vo);
	}
	
	public int write(MemberVO vo)  throws Exception {
		
		return mapper.write(vo);
	}

	public int delete(MemberVO vo)  throws Exception {
		
		return mapper.delete(vo);
	}

	public LoginVO login(LoginVO invo) throws Exception{
				
		return mapper.login(invo);
	
	}

	public String idCheck(String id) throws Exception{
		return mapper.idCheck(id);
	}

	public int changeStatus(MemberVO vo) throws Exception{
		return mapper.changeStatus(vo);
	}

	public int changeGradeNo(MemberVO vo) throws Exception{
		return mapper.changeGradeNo(vo);
	}
	
	
}
