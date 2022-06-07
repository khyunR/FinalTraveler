package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.domain.ReservationDTO;
import com.lec.spring.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;

	@RequestMapping("/makeOk")
	public String make(ReservationDTO dto, Model model) {
		model.addAttribute("result", reservationService.insert(dto));
		return "/reservation/makeOk";
	}
	
}
