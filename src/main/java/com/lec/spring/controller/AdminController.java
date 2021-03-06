package com.lec.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lec.spring.domain.AuthDTO;
import com.lec.spring.domain.MemberAuthDTO;
import com.lec.spring.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserService userService;
	
	@RequestMapping({"", "/"})
	public String login(Model model) {
		List<LocalDateTime> list =  userService.selectRegDate();
		System.out.println(list.toString());
		
		model.addAttribute("prevMonthsName",userService.getPrevMonthes());
		model.addAttribute("prevMonthsCnt", userService.countPrevMonths(list));
		System.out.println(model.getAttribute("prevMonthsName"));
		System.out.println(model.getAttribute("prevMonthsCnt"));
		
		return "/admin/admin";
	}
	
	@PostMapping("/notice/ckUpload")
	public void postNoticeCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		 
		 String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
		 System.out.println("uploadPath  : "+uploadPath);
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("application/json");
		 
		 try {
		  
		  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		  String ckUploadPath = uploadPath + File.separator + "ckUpload/notice" + File.separator + uid + "_" +fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush(); // out에 저장된 데이터를 전송하고 초기화
		  
		  //String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/ckUpload/notice/" + uid + "_" +fileName; // 작성화면
		  // 업로드시 메시지 출력
		  JSONObject json = new JSONObject();
		  json.put("uploaded", 1);
		  json.put("fileName", fileName);
		  json.put("url", fileUrl);
		  printWriter.println(json);
		  
		  printWriter.flush();
		  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
		  System.out.println("url : "+fileUrl);
		  System.out.println("ckUploadPath : "+ckUploadPath);
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
	}
	
	@PostMapping("/location/ckUpload")
	public void postLocationCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		
		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
		System.out.println("uploadPath  : "+uploadPath);
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		try {
			
			String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();
			
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload/location" + File.separator + uid + "_" +fileName;
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
			
			//String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/location/" + uid + "_" +fileName; // 작성화면
			// 업로드시 메시지 출력
			JSONObject json = new JSONObject();
			json.put("uploaded", 1);
			json.put("fileName", fileName);
			json.put("url", fileUrl);
			printWriter.println(json);
			
			printWriter.flush();
			System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
			System.out.println("url : "+fileUrl);
			System.out.println("ckUploadPath : "+ckUploadPath);
		} catch (IOException e) { e.printStackTrace();
		} finally {
			try {
				if(out != null) { out.close(); }
				if(printWriter != null) { printWriter.close(); }
			} catch(IOException e) { e.printStackTrace(); }
		}
		
		return; 
	}
	
	@RequestMapping("/authority")
	public void authority(Model model) {
		model.addAttribute("list", userService.selectAuths());
	}
	
	@GetMapping("/addAdminAuth")
	public String addAdminAuth(String username, Model model) {
		model.addAttribute("reult", userService.insertAuthByUsername(username, "ROLE_ADMIN"));
		return "/admin/authChangeOk";
	}
	@GetMapping("/removeAdminAuth")
	public String removeAdminAuth(String username, Model model) {
		model.addAttribute("reult", userService.deleteAuth(username, "ROLE_ADMIN"));
		return "/admin/authChangeOk";
	}
}
