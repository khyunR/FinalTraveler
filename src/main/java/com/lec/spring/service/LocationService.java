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
	
	public int countPosts() {
		return dao.countPosts();
	}

	public List<LocationDTO> list(int targetPageStartPostNo) {
		return dao.select(targetPageStartPostNo);
	}

	public List<LocationDTO> viewByUid(int uid) {
		List<LocationDTO> list = dao.selectByUid(uid);
		if(!list.isEmpty()) {
			int cnt = dao.incViewCnt(uid);
			if(cnt==1)
				return list;
		}
		return null;
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

	public List<String> getImgSrcList (LocationDTO dto){
		List<String> result = new ArrayList<>();
		String content = dto.getContent();
		Document doc = Jsoup.parseBodyFragment(content);
		Elements imgs = doc.getElementsByTag("img");
		result = imgs.eachAttr("src");
		return result;
	}

	public String getContentDetail (LocationDTO dto){
		String result = "";
		System.out.println("getContentDetail() 호출");
		String content = dto.getContent();
		Document doc = Jsoup.parseBodyFragment(content);
		
		System.out.println(doc.html());
		result = doc.body().html();
		result = result.split("&lt;div id=\"detail\"&gt;")[1].replace("&lt;/div&gt;", "");
		System.out.println("getContentDetail(): " + result);

		return result;
	}

	public List<Integer> getPostUidListHome (List<LocationDTO> list){
		List<Integer> result = new ArrayList<>();
		for (LocationDTO dto : list) {
			result.add(dto.getUid());
		}
		return result;
	}
	public List<String> getLocationNameListHome (List<LocationDTO> list){
		List<String> result = new ArrayList<>();
		for (LocationDTO dto : list) {
			result.add(dto.getLocationName());
		}
		return result;
	}
		
}
