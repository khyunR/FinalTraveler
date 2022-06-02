package com.lec.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.LocationDAO;
import com.lec.spring.domain.LocationDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


@Service
public class LocationService {

	@Autowired
	LocationDAO dao;
	

	public List<LocationDTO> list() {
		
		return dao.select();
	}

	public List<LocationDTO> viewByUid(int uid) {
		if(dao.incViewCnt(uid)!=1) {
			return null;
		}
		List<LocationDTO> list = dao.selectByUid(uid);
		if(list.isEmpty()) {
			dao.decViewCnt(uid);
		}
		System.out.println("viewCnt++ succeed");
		return list;
	}
	
	public List<LocationDTO> selectTop3ViewCnt(){
		return dao.selectTop3ViewCnt();
	}

	public int write(LocationDTO dto) {

		return dao.insert(dto);
	}

	public List<LocationDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);
	}

	public int update(LocationDTO dto) {
		return dao.update(dto);
	}

	public int deleteByUid(int uid) {
		return dao.deleteByUid(uid);
	}
	
	public List<String> getImgSrcList (List<LocationDTO> list){
		List<String> result = new ArrayList<>();
		for (LocationDTO dto : list) {
			String content = dto.getContent();
			Document doc = Jsoup.parseBodyFragment(content);
			Element img = doc.getElementsByTag("img").first();
			String src = "";
			if(img != null) {
			    src = img.attr("src");
			}
			result.add(src);
		}
		return result;
	}
	public List<Integer> getPostUidList (List<LocationDTO> list){
		List<Integer> result = new ArrayList<>();
		for (LocationDTO dto : list) {
			result.add(dto.getUid());
		}
		return result;
	}
	public List<String> getLocationNameList (List<LocationDTO> list){
		List<String> result = new ArrayList<>();
		for (LocationDTO dto : list) {
			result.add(dto.getLocationName());
		}
		return result;
	}
		
}
