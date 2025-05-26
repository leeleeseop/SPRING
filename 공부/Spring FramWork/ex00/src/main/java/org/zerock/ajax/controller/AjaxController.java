package org.zerock.ajax.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.category.service.CategoryService;
import org.zerock.goods.service.GoodsService;
import org.zerock.member.vo.LoginVO;
import org.zerock.message.service.MessageService;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ajax")
@Log4j
public class AjaxController {

	
	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("categoryServiceImpl")
	private CategoryService categoryService;
	
	@Autowired
	@Qualifier("goodsServiceImpl")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	//--- 상품 중분류 가져오기 ------------------------------------
	@GetMapping("/getMidList.do")
	public String getMidList(Model model, Integer cate_code1) {
		log.info("getMidList.do");
		// 중분류를 가져와서 JSP로 넘기기.
		model.addAttribute("midList", categoryService.list(cate_code1));
		// midList.jsp에 select tag 작성.
		return "goods/midList";
	}
	
	//--- 상품 size 가져오기 ------------------------------------
	@GetMapping("/getSize.do")
	public String getSize(Model model, Integer cate_code1) {
		log.info("getSize.do");
		// 중분류를 가져와서 JSP로 넘기기.
		model.addAttribute("sizeList", goodsService.getSize(cate_code1));
		// midList.jsp에 select tag 작성.
		return "goods/sizeList";
	}
	
	//--- 상품 색상 가져오기 ------------------------------------
	@GetMapping("/getColor.do")
	public String getColor(Model model, Integer cate_code1) {
		log.info("getColor.do");
		// 중분류를 가져와서 JSP로 넘기기.
		model.addAttribute("colorList", goodsService.getColor(cate_code1));
		// midList.jsp에 select tag 작성.
		return "goods/colorList";
	}
	
	
	@GetMapping("/newMessageList.do")
	public String getNewMessageList(HttpSession session, Model model) {
		
		PageObject pageObject = new PageObject(1, 4);
		
		String id = getId(session);
		pageObject.setAccepter(id);
		pageObject.setAcceptMode(1);
		
		log.info(pageObject);
		
		model.addAttribute("newList", messageService.getNewMessageList(pageObject));
		
		return "message/newList";
	}
	
	private String getId(HttpSession session) {
		return ((LoginVO)session.getAttribute("login")).getId();
		
	}
	
}
