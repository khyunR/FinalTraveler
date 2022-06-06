package com.lec.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.spring.config.PrincipalDetails;
import com.lec.spring.domain.LocationDTO;
import com.lec.spring.pagination.Criteria;
import com.lec.spring.pagination.Paging;
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
		dto.setImageFilePaths(String.join(" ", locationService.getImgSrcList(dto)));
		model.addAttribute("result", locationService.write(dto));
		model.addAttribute("dto", dto);  // auto-generated key 
	}

	@GetMapping("/view")
	public String view(int uid, Model model, RedirectAttributes redirect, HttpServletRequest request, HttpServletResponse response) {
		List<LocationDTO> list = locationService.viewByUid(uid);
		String page = "/location/view";

		if(!request.isUserInRole("ROLE_ADMIN")) {
			LocationDTO dto = list.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			list.set(0, dto);
			redirect.addFlashAttribute("result", list);
			return "redirect:/travel/"+list.get(0).getCategory()+"/view?uid="+ list.get(0).getUid();
		}

		model.addAttribute("list", list);
		return page;

		
	}
	
	@GetMapping("/update")
	public void update(int uid, Model model) {
		model.addAttribute("list", locationService.selectByUid(uid));
	}
	
	@PostMapping("/updateOk")
	public void updateOk(LocationDTO dto, Model model) {
		dto.setImageFilePaths(String.join(" ", locationService.getImgSrcList(dto)));
		model.addAttribute("result", locationService.update(dto));
		model.addAttribute("dto", dto);
	}
	
	@PostMapping("/deleteOk")
	public void deleteOk(int uid, Model model) {
		model.addAttribute("result", locationService.deleteByUid(uid));
	}
	
	@GetMapping("/viewTest")
	public String viewTest(int uid, Model model, RedirectAttributes redirect) {
		List<LocationDTO> result = locationService.selectByUid(uid);
		LocationDTO dto = new LocationDTO();
		if(result!=null || !result.isEmpty()) {
			dto = result.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			result.set(0, dto);
		}
		model.addAttribute("result", result);
		redirect.addFlashAttribute("result", result);
		return "redirect:/travel/"+(String)dto.getCategory()+"/viewTest?uid="+ Integer.toString(dto.getUid());
	}
}
