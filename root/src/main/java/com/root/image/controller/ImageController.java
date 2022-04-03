package com.root.image.controller;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.image.service.ImageService;
import com.root.image.vo.ImageVO;
import com.root.member.vo.LoginVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/image")
public class ImageController {

	@Inject
	private ImageService service;

	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
		if (pageObject.getPage() < 1)
			pageObject.setPage(1);
		if (pageObject.getPerPageNum() == 10)
			pageObject.setPerPageNum(8);
		log.info("ImageController.list().pageObjecct - " + pageObject);

		model.addAttribute("list", service.list(pageObject));
		return "image/list";
	}

	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("ImageController.view");
		ImageVO vo = service.view(no);

		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo", vo);

		return "image/view";
	}

	// 2-2. changeImage
	@PostMapping("/changeImage.do")
	public String changeImage(PageObject pageObject, ImageVO vo, HttpServletRequest request) throws Exception {
		String path = "/upload/image";
		// 서버의 파일을 업로드 한다. -> DB에 저장할 파일 정보가 나온다.
		String fileName = FileUtil.upload(path, vo.getImage(), request);
		vo.setFileName(fileName);
		// DB에 파일 정보를 바꾼다. -> 번호, 파일명
		service.changeImage(vo);
		// 이전의 파일은 지운다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteImage(), request));

		// 파일이 로드 되는 중간에 보기로 이동을 해버리면 이미지가 안보인다. 그래서 올리는 동안의 시간을 일정시간을 재운다.
		Thread.sleep(1000);

		return "redirect:view.do?no=" + vo.getNo() + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word="
				+ URLEncoder.encode(pageObject.getWord(), "utf-8");
	}

	@GetMapping("/write.do")
	// 3-1. writeForm
	public String writeForm() throws Exception {
		log.info("ImageController.writeForm");
		return "image/write";
	}

	@PostMapping("/write.do")
	// 3-2. write
	public String write(PageObject pageObject, ImageVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		log.info("ImageController.write");
		log.info(pageObject);
		// 작성자 아이디 세팅
		vo.setId(((LoginVO) session.getAttribute("login")).getId());

		// 파일명을 세팅한다.
		String path = "/upload/image";
		String fileNaem = FileUtil.upload(path, vo.getImage(), request);
		vo.setFileName(fileNaem);

		log.info(vo);
		// DB에 정보 저장
		service.write(vo);
		Thread.sleep(500);
		rttr.addFlashAttribute("msg", "성공적으로 글 등록 되었습니다.");
		return "redirect:list.do?page=1&perPageNum=" + pageObject.getPerPageNum();
	}

	// 4-1. updateForm
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("ImageController.updateForm");
		model.addAttribute("vo", service.view(no));
		return "image/update";
	}

	// 4-2. update
	@PostMapping("/update.do")
	public String update(PageObject pageObject, ImageVO vo, RedirectAttributes rttr) throws Exception {
		log.info("ImageController.update");
		log.info(vo);
		log.info(pageObject);
		service.update(vo);
		
		rttr.addFlashAttribute("msg", "성공적으로 글 수정 되었습니다.");
		return "redirect:view.do?no=" + vo.getNo() + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word="
				+ URLEncoder.encode(pageObject.getWord(), "utf-8");
	}

	// 5. delete
	@GetMapping("/delete.do")
	public String delete(PageObject pageObject, long no, String deleteImage, HttpServletRequest request)
			throws Exception {
		log.info("ImageController.delete");
		log.info(pageObject);
		// 1. DB의 정보를 지운다. - no
		service.delete(no);
		// 2. 서버에서 파일을 지운다. - deleteImage
		FileUtil.remove(FileUtil.getRealPath("", deleteImage, request));
		//

		return "redirect:list.do?perPageNum=" + pageObject.getPerPageNum();
	}

}
