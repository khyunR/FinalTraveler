package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.common.Criteria;
import com.lec.spring.common.Paging;
import com.lec.spring.config.PrincipalDetails;
import com.lec.spring.domain.WriteDTO;
import com.lec.spring.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}


	public NoticeController() {
		System.out.println("NoticeController() 생성");
	}
	
	
	@RequestMapping("/list")
	public void list(Integer page, Model model) {
		int totalPostsCount = noticeService.countPosts();
		if(page==null || page <1) {
			page = 1;
		}
		Paging paging = new Paging();
		paging.setCri(new Criteria(page));
		paging.setTotalCount(totalPostsCount);
		
		System.out.println(paging);
		
		model.addAttribute("list", noticeService.list((paging.getCri().getPage()-1)*10));
		model.addAttribute("paging", paging);
	}
	
	@GetMapping("/write")
	public void write(Model model) {}
	
	@PostMapping("/writeOk")
	public void writeOk(WriteDTO dto, Model model) {
		PrincipalDetails principal = (PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMb_uid(principal.getUid());
		model.addAttribute("result", noticeService.write(dto));
		model.addAttribute("dto", dto);  // auto-generated key 
	}

	@GetMapping("/view")
	public void view(int uid, Model model) {
		model.addAttribute("list", noticeService.viewByUid(uid));
	}
	
	@GetMapping("/update")
	public void update(int uid, Model model) {
		model.addAttribute("list", noticeService.selectByUid(uid));
	}
	
	@PostMapping("/updateOk")
	public void updateOk(WriteDTO dto, Model model) {
		model.addAttribute("result", noticeService.update(dto));
		model.addAttribute("dto", dto);
	}
	
	@PostMapping("/deleteOk")
	public void deleteOk(int uid, Model model) {
		model.addAttribute("result", noticeService.deleteByUid(uid));
	}
	
}





