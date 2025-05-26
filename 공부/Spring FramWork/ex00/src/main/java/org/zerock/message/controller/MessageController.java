package org.zerock.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.vo.LoginVO;
import org.zerock.message.service.MessageService;
import org.zerock.message.vo.MessageVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/message")
@Log4j
public class MessageController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService service;
	
	//--- 메시지 리스트 ------------------------------------
	@GetMapping("/list.do")
	// public ModelAndView list(Model model) {
	public String list(Model model, @RequestParam(defaultValue = "1") int mode, HttpServletRequest request)
			throws Exception {
		log.info("list.do");
		// request.setAttribute("list", service.list());
		
		String id = getId(request.getSession());
		
		// 페이지 처리를 위한 객체 생겅
		PageObject pageObject = PageObject.getInstance(request);
		
		// mode = 1 - 받은 메시지(기본), 2 - 보낸 메시지, 3 - 모든 메시지
		pageObject.setAcceptMode(mode);
		
		pageObject.setAccepter(id);
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "message/list";
		
	}
	
	//--- 메시지 글보기 ------------------------------------
	@GetMapping("/view.do")
	public String view(Model model, Long no) {
		log.info("view.do");
		
		model.addAttribute("vo", service.view(no));
		
		return "message/view";
	}
	
	//--- 메시지 글등록 폼 ------------------------------------
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do");
		return "message/writeForm";
	}
	
	//--- 메시지 글등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(MessageVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "메시지 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	//--- 메시지 글수정 폼 ------------------------------------
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model) {
		log.info("updateForm.do");
		
		model.addAttribute("vo", service.view(no));
		
		return "message/updateForm";
	}
	
	//--- 메시지 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(MessageVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "메시지 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"메시지 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
	}
	
	
	//--- 메시지 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(MessageVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "메시지 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"메시지 삭제가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
		}
	}
	
	//--- 아이디를 가져 오는 메서드 ------------------------------------
	private String getId(HttpSession session) {
		return ((LoginVO)session.getAttribute("login")).getId();
	}
	
}
