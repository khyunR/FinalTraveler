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
import com.lec.spring.domain.LocationDTO;
import com.lec.spring.service.LocationService;

@Controller
@RequestMapping("/location")
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	public LocationController() {
		System.out.println("LocationController() 생성");
	}
	
	@RequestMapping("/list")
	public void list(Integer page, Model model) {
		
		if(page==null || page <1) {
			page = 1;
		}
		
		int totalPostsCount = locationService.countPosts();
		
		Paging paging = new Paging();
		paging.setCri(new Criteria(page));
		paging.setTotalCount(totalPostsCount);
		
		System.out.println(paging);
		
		model.addAttribute("list", locationService.list((paging.getCri().getPage()-1)*10));
		model.addAttribute("paging", paging);
	}
	
	@GetMapping("/write")
	public void write(Model model) {}
	
	@PostMapping("/writeOk")
	public void writeOk(LocationDTO dto, Model model) {
		PrincipalDetails principal = (PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMb_uid(principal.getUid());
		model.addAttribute("result", locationService.write(dto));
		model.addAttribute("dto", dto);  // auto-generated key 
	}

	@GetMapping("/view")
	public void view(int uid, Model model) {
		model.addAttribute("list", locationService.viewByUid(uid));
	}
	
	@GetMapping("/update")
	public void update(int uid, Model model) {
		model.addAttribute("list", locationService.selectByUid(uid));
	}
	
	@PostMapping("/updateOk")
	public void updateOk(LocationDTO dto, Model model) {
		model.addAttribute("result", locationService.update(dto));
		model.addAttribute("dto", dto);
	}
	
	@PostMapping("/deleteOk")
	public void deleteOk(int uid, Model model) {
		model.addAttribute("result", locationService.deleteByUid(uid));
	}
	
	
}
