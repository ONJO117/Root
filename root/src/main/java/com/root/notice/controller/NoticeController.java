package com.root.notice.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.notice.service.NoticeService;
import com.root.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		if(pageObject.getPage() < 1) pageObject.setPage(1);
		log.info("NoticeController.list().pageObject - " + pageObject);
		
		model.addAttribute("list", service.list(pageObject));
		return "notice/list";
	}

	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		log.info("NoticeController.view().no : " + no);
		NoticeVO vo = service.view(no);
		
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo", vo);
		return "notice/view";
	}
	
	@GetMapping("/write.do")
	public String writeForm() throws Exception  {
		log.info("NoticeController.writeForm ");

		return "notice/write";
	}
	@PostMapping("/write.do")
	public String write(NoticeVO vo, int perPageNum, RedirectAttributes rttr) throws Exception  {
		log.info("NoticeController.write().vo - " + vo);
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "성공적으로 글 등록 되었습니다.");
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;
	}
	
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception  {
		log.info("NoticeController.updateForm ");
		model.addAttribute("vo", service.view(no));
		return "notice/update";
	}
	@PostMapping("/update.do")
	public String update(PageObject pageObject, NoticeVO vo, RedirectAttributes rttr) throws Exception  {
		log.info("NoticeController.update().vo - " + vo);
		service.update(vo);
		
		rttr.addFlashAttribute("msg", "성공적으로 글 수정 되었습니다.");
		return "redirect:view.do?no=" + vo.getNo() + "&page="+pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum()
		+ "&key=" + pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getWord(), "utf-8")
		;
	}
	
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum, RedirectAttributes rttr)  throws Exception  {
		log.info("NoticeController.delete");
		service.delete(no);
		
		rttr.addFlashAttribute("msg", "성공적으로 글 삭제가 되었습니다.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
}
