package com.root.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.member.service.MemberService;
import com.root.member.vo.LoginVO;
import com.root.member.vo.MemberVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/login.do")
	public String loginForm() {
		
		log.info("login 폼으로 이동");
		return "member/login";
	}
	
	@PostMapping("/login.do")
	public String login(LoginVO invo, HttpSession session) throws Exception{
		
		log.info("로그인 처리 - invo : " + invo);
		session.setAttribute("login", service.login(invo));
		
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		
		model.addAttribute("list", service.list(pageObject));
		return "member/list";
	}

	@GetMapping("/view.do")
	public String view(String id, Model model, HttpSession session) throws Exception{
		
		if(id == null) {
			model.addAttribute("title", "내 정보 보기");
			id = ((LoginVO) session.getAttribute("login")).getId();
		}
		else {
			model.addAttribute("title", "회원 정보 보기");
		}
		model.addAttribute("vo", service.view(id));
		
		return "member/view";
	}
	
	// 2-2. changePhoto
	@PostMapping("/changePhoto.do")
	public String changeImage(MemberVO vo, HttpServletRequest request) throws Exception {
		String path = "/upload/member";
		// 서버의 파일을 업로드 한다. -> DB에 저장할 파일 정보가 나온다.
		String fileName = FileUtil.upload(path, vo.getPhotoFile(), request);
		vo.setPhoto(fileName);
		// DB에 파일 정보를 바꾼다. -> 번호, 파일명
		service.changePhoto(vo);
		// 이전의 파일은 지운다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeletePhoto(), request));

		// 파일이 로드 되는 중간에 보기로 이동을 해버리면 이미지가 안보인다. 그래서 올리는 동안의 시간을 일정시간을 재운다.
		Thread.sleep(3000);

		return "redirect:view.do?id=" + vo.getId();
	}
	
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		return "member/write";
	}
	
	@PostMapping("/write.do")
	public String write(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String path = "/upload/member";
		
		vo.setPhoto(FileUtil.upload(path, vo.getPhotoFile(), request));
		
		service.write(vo);
		rttr.addFlashAttribute("msg", "성공적으로 회원가입이 되셨습니다. \\n 로그인 후 이용 해주세요.");
		
		return "redirect:/member/login.do";
	}
	@GetMapping("/update.do")
	public String updateForm(String id, Model model) throws Exception{
		model.addAttribute("vo", service.view(id));
		return "member/update";
	}
	
	@PostMapping("/update.do")
	public String update(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		service.update(vo);
		rttr.addFlashAttribute("msg", "성공적으로 회원 수정이 되셨습니다. \\n 로그인 후 이용 해주세요.");
		
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		
		model.addAttribute("id", service.idCheck(id));
		
		return "member/idCheck";
		
	}
	
	@GetMapping("/delete.do")
	public String delete(HttpSession session ,MemberVO vo, RedirectAttributes rttr) throws Exception{
		session.removeAttribute("login");
		service.delete(vo);
		rttr.addFlashAttribute("msg", "성공적으로 글 삭제가 되었습니다.");
		return "redirect:/main/main.do";
		
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("login");
		log.info("로그인아웃 처리됨");
		return "redirect:/image/list.do";
	}

	@PostMapping("/changeStatus.do")
	public String changeStatus(PageObject pageObject, MemberVO vo) throws Exception{
		
		service.changeStatus(vo);
		return "redirect:view.do?id=" + vo.getId() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}

	@PostMapping("/changeGradeNo.do")
	public String changeGradeNo(PageObject pageObject, MemberVO vo) throws Exception{
		
		service.changeGradeNo(vo);
		
		return "redirect:view.do?id=" + vo.getId() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	
}
