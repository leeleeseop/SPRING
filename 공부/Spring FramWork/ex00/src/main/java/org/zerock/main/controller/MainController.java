package org.zerock.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.board.service.BoardService;
import org.zerock.goods.service.GoodsService;
import org.zerock.main.service.MainService;
import org.zerock.notice.service.NoticeService;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	@Qualifier("mainServiceImpl")
	private MainService service;

	@Autowired
	@Qualifier("goodsServiceImpl")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@GetMapping(value = {"/", "/main.do"})
	public String goMain() {
		log.info("redirect main......................");
		return "redirect:/main/main.do";
	}
	
	@GetMapping(value = {"/main/main.do"})
	public String main(Model model) {
		log.info("/member/main.do ......................");
		
		PageObject pageObject = new PageObject();
		
		// 상품 리스트 9개 가져오기 - carousel 데이터로 사용
		pageObject.setPerPageNum(9);
		
		model.addAttribute("goodsList", goodsService.list(pageObject, null));
		
		// 공지사항과 일반 게시판 리스트 5개 가져오기 - carousel 데이터로 사용
		pageObject.setPerPageNum(5);
		
		model.addAttribute("noticeList", noticeService.list(pageObject));
		model.addAttribute("boardList", boardService.list(pageObject));
		
		return "main/main";
	}
	
	@GetMapping(value = {"/main/searchList.do"})
	public String searchList(Model model, HttpServletRequest request) throws Exception {
		log.info("/member/searchList.do ......................");
		PageObject pageObject = PageObject.getInstance(request);
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject",pageObject);
		return "main/searchList";
	}
	
}
