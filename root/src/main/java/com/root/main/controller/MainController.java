package com.root.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.root.image.service.ImageService;
import com.root.notice.service.NoticeService;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class MainController {

	// 자동 DI 적용
	@Autowired
	@Qualifier("NoticeService")
	private NoticeService noticeService;
	@Autowired
	@Qualifier("ImageService")
	private ImageService imageService;
	
	@GetMapping("/main.do")
	public String main(Model model) throws Exception {
		PageObject pageObject = new PageObject(1, 7);
		noticeService.noticeList(pageObject);
		log.info(pageObject);
		model.addAttribute("noticeList", noticeService.noticeList(pageObject));
		
		pageObject = new PageObject(1, 4);
		imageService.imageList(pageObject);
		log.info(pageObject);
		model.addAttribute("imageList", imageService.imageList(pageObject));
		
		return "main/main";

	}
}
