package com.root.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.board.service.BoardService;
import com.root.board.vo.BoardVO;
import com.root.board.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {

	// 의존성 자동 주입(Dependency Inject) ->  자동으로 하도록 지정하는 어노테이션 : @Autowired, @Inject
	@Autowired
	private BoardService service;
	
	// 1. list
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
		if(pageObject.getPage() < 1) pageObject.setPage(1);
		log.info(pageObject);
		model.addAttribute("list", service.list(pageObject));
		return "board/list";
	}

	// 2. view
	@GetMapping("/view.do")
	public String view(long no, int inc, Model model)  throws Exception  {
		BoardVO vo = service.view(no, inc);
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		List<ReplyVO> list = service.replySelect(no);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "board/view";
	}

	// 3-1. writeForm
	@GetMapping("/write.do")
	public String writeForm() throws Exception  {
		return "board/write";
	}
	
	// 3-2. write
	@PostMapping("/write.do")
	public String write(BoardVO vo, int perPageNum, RedirectAttributes rttr) throws Exception  {
		service.write(vo);
				rttr.addFlashAttribute("msg", "성공적으로 글 등록이 되었습니다.");
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;
	}
	
	// 4-1. updateForm
	@GetMapping("/update.do")
	public String updateForm(long no, Model model)  throws Exception  {
		model.addAttribute("vo", service.view(no, 0));
		return "board/update";
	}
	
	// 4-2. update
	@PostMapping("/update.do")
	public String update(PageObject pageObject, BoardVO vo) throws Exception  {
		service.update(vo);
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0" + "&page="+pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	// 5. delete
	@GetMapping("/delete.do")
	public String delete(BoardVO vo,int perPageNum,  RedirectAttributes rttr)  throws Exception  {
		service.delete(vo);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}

	
	// 6. rep
	@PostMapping("/replyInsert.do")
	public String replyInsert(ReplyVO vo, PageObject pageObject)  throws Exception  {
		service.replyInsert(vo);
		return  "redirect:view.do?no="+ vo.getNo() + "&inc=0" + "&page="+pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}

	// 7. replyRemove
	@GetMapping("/replyRemove.do")
	public String replyRemove(ReplyVO vo, PageObject pageObject)  throws Exception  {
		service.replyRemove(vo);
		return "redirect:view.do?no="+ vo.getNo() + "&inc=0" + "&page="+pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}

}
