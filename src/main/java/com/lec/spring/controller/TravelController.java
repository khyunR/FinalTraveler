package com.lec.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel")
public class TravelController {
	@RequestMapping("/namsanTower")
	public String namsanTower() {
		return "/travel/namsanTower";
	}
	@RequestMapping("/olympicPark")
	public String olympicPark() {
		return "/travel/olympicPark";
	}
	@RequestMapping("/seoulForest")
	public String seoulForest() {
		return "/travel/seoulForest";
	}
}