package com.lec.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.spring.domain.LocationDTO;
import com.lec.spring.service.LocationService;

@Controller
@RequestMapping("/travel")
public class TravelController {
	
	@Autowired
	LocationService locationService;
	
	@RequestMapping("/culture/cultureList")
	public String cultureList() {
		return "/travel/culture/cultureList";
	}
	@RequestMapping("/park/parkList")
	public String parkList() {
		return "/travel/park/parkList";
	}
	@RequestMapping("/museum/museumList")
	public String museumList() {
		return "/travel/museum/museumList";
	}
	@RequestMapping("/attraction/attractionList")
	public String attractionList() {
		return "/travel/attraction/attractionList";
	}
	@RequestMapping("/culture/gyeongbokgung")
	public String gyeongbokgung() {
		return "/travel/culture/gyeongbokgung";
	}
	@RequestMapping("/culture/changdeokgung")
	public String changdeokgung() {
		return "/travel/culture/changdeokgung";
	}
	@RequestMapping("/culture/jongmyoShrine")
	public String jongmyoShrine() {
		return "/travel/culture/jongmyoShrine";
	}
	@RequestMapping("/culture/deoksugung")
	public String deoksugung() {
		return "/travel/culture/deoksugung";
	}
	@RequestMapping("/culture/changgyeonggung")
	public String changgyeonggung() {
		return "/travel/culture/changgyeonggung";
	}
	@RequestMapping("/culture/gyeonghuigung")
	public String gyeonghuigung() {
		return "/travel/culture/gyeonghuigung";
	}
	@RequestMapping("/park/olympicPark")
	public String olympicPark() {
		return "/travel/park/olympicPark";
	}
	@RequestMapping("/park/seoulForest")
	public String seoulForest() {
		return "/travel/park/seoulForest";
	}
	@RequestMapping("/park/hangangPark")
	public String hangangPark() {
		return "/travel/park/hangangPark";
	}
	@RequestMapping("/park/yongsanPark")
	public String yongsanPark() {
		return "/travel/park/yongsanPark";
	}
	@RequestMapping("/park/skyPark")
	public String skyPark() {
		return "/travel/park/skyPark";
	}
	@RequestMapping("/park/naksanPark")
	public String naksanPark() {
		return "/travel/park/naksanPark";
	}
	@RequestMapping("/park/sunyudoPark")
	public String sunyudoPark() {
		return "/travel/park/sunyudoPark";
	}
	@RequestMapping("/museum/nationalMuseum")
	public String nationalMuseum() {
		return "/travel/museum/nationalMuseum";
	}
	@RequestMapping("/museum/historyMuseum")
	public String historyMuseum() {
		return "/travel/museum/historyMuseum";
	}
	@RequestMapping("/museum/palaceMuseum")
	public String palaceMuseum() {
		return "/travel/museum/palaceMuseum";
	}
	@RequestMapping("/museum/seodaemunPrison")
	public String seodaemunPrison() {
		return "/travel/museum/seodaemunPrison";
	}
	@RequestMapping("/museum/contemporaryArt")
	public String contemporaryArt() {
		return "/travel/museum/contemporaryArt";
	}
	@RequestMapping("/museum/seoulArt")
	public String seoulArt() {
		return "/travel/museum/seoulArt";
	}
	@RequestMapping("/attraction/namsanTower")
	public String namsanTower() {
		return "/travel/attraction/namsanTower";
	}
	@RequestMapping("/attraction/hanokVillage")
	public String hanokVillage() {
		return "/travel/attraction/hanokVillage";
	}
	@RequestMapping("/attraction/lotteTower")
	public String lotteTower() {
		return "/travel/attraction/lotteTower";
	}
	@RequestMapping("/attraction/cheonggyeCreek")
	public String cheonggyeCreek() {
		return "/travel/attraction/cheonggyeCreek";
	}
	@RequestMapping("/attraction/cheongwadae")
	public String cheongwadae() {
		return "/travel/attraction/cheongwadae";
	}
	@RequestMapping("/attraction/lotteWorld")
	public String lotteWorld() {
		return "/travel/attraction/lotteWorld";
	}
	
	@GetMapping("/attraction/view")
	public String attractionView(int uid, Model model, RedirectAttributes redirect) {
		List<LocationDTO> result = (List<LocationDTO>)redirect.getAttribute("result");
		
		if(result==null || result.isEmpty()) {
			result = locationService.selectByUid(uid);
			LocationDTO dto = result.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			result.set(0, dto);
		}
		
		model.addAttribute("result", result);
		return "/travel/attraction/view";
	}
	@GetMapping("/culture/view")
	public String cultureView(int uid, Model model, RedirectAttributes redirect) {
		List<LocationDTO> result = (List<LocationDTO>)redirect.getFlashAttributes().get("result");
		
		if(result==null || result.isEmpty()) {
			result = locationService.viewByUid(uid);
			LocationDTO dto = result.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			result.set(0, dto);
		}
		
		model.addAttribute("result", result);
		return "/travel/attraction/view";
	}
	@GetMapping("/museum/view")
	public String museumView(int uid, Model model, RedirectAttributes redirect) {
		List<LocationDTO> result = (List<LocationDTO>)redirect.getAttribute("result");
		
		if(result==null || result.isEmpty()) {
			result = locationService.selectByUid(uid);
			LocationDTO dto = result.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			result.set(0, dto);
		}
		
		model.addAttribute("result", result);
		return "/travel/museum/view";
	}
	@GetMapping("/park/view")
	public String parkView(int uid, Model model, RedirectAttributes redirect) {
		List<LocationDTO> result = (List<LocationDTO>)redirect.getAttribute("result");
		
		if(result==null || result.isEmpty()) {
			result = locationService.selectByUid(uid);
			LocationDTO dto = result.get(0);
			dto.setContent(locationService.getContentDetail(dto));
			result.set(0, dto);
		}
		
		model.addAttribute("result", result);
		return "/travel/park/view";
	}
}