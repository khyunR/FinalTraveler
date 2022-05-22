package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.domain.WriteDTO;
import com.lec.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}


	public BoardController() {
		System.out.println("BoardController() 생성");
	}
	
	
	@RequestMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", boardService.list());
	}
	
	@GetMapping("/write")
	public void write(Model model) {}
	
	@PostMapping("/writeOk")
	public void writeOk(WriteDTO dto, Model model) {
		model.addAttribute("result", boardService.write(dto));
		model.addAttribute("dto", dto);  // auto-generated key 
	}

	@GetMapping("/view")
	public void view(int uid, Model model) {
		model.addAttribute("list", boardService.viewByUid(uid));
	}
	
	@GetMapping("/update")
	public void update(int uid, Model model) {
		model.addAttribute("list", boardService.selectByUid(uid));
	}
	
	@PostMapping("/updateOk")
	public void updateOk(WriteDTO dto, Model model) {
		model.addAttribute("result", boardService.update(dto));
		model.addAttribute("dto", dto);
	}
	
	@RequestMapping("/deleteOk")
	public void deleteOk(int uid, Model model) {
		model.addAttribute("result", boardService.deleteByUid(uid));
	}
	
}





