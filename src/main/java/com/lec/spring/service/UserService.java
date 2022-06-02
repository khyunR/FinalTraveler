package com.lec.spring.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.EnumerablePropertySource;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.AuthDTO;
import com.lec.spring.domain.Count;
import com.lec.spring.domain.MemberAuthDTO;
import com.lec.spring.domain.UserDAO;
import com.lec.spring.domain.UserDTO;

import lombok.Data;

@Service
public class UserService {
	

	UserDAO dao;

	@Autowired
	public UserService(UserDAO dao) {
		this.dao = dao;
	}
	
	public int insert(UserDTO dto) {
		int cnt =  dao.insert(dto);
		if(cnt==1) {
			dao.insertAuth(dto.getUid(), "ROLE_MEMBER");			
		}
		return cnt;
	}
	
	public UserDTO selectByUsername(String username) {
		return dao.selectByUsername(username);
	}
	
	public String selectUsernameByNameEmail(UserDTO dto) {
		return dao.selectUsernameByNameEmail(dto);
	}
	
	public UserDTO selectByUsernameEmail(UserDTO dto) {
		return dao.selectByUsernameEmail(dto);
	}
	
	public int updatePassword(UserDTO dto) {
		return dao.updatePassword(dto);
	}

	public int update(UserDTO dto) {
		return dao.update(dto);
	}
	
	public List<UserDTO> selectByUsernameLike(String searchKey){
		return dao.selectByUsernameLike(searchKey);
	}
	
	public int insertAuth(int mb_uid, String auth) {
		return dao.insertAuth(mb_uid, auth);
	}
	
	public List<MemberAuthDTO> selectAuths() {
		List<AuthDTO> list =  dao.selectAuths();
		List<MemberAuthDTO> result = new ArrayList<MemberAuthDTO>();
		
		if(list==null || list.isEmpty()) return result;
		
		String tempUsernameVal = "";
		MemberAuthDTO tempMbAuthDto = new MemberAuthDTO();
		for (AuthDTO dto : list) {
			String username = dto.getUsername();
			if(!username.equalsIgnoreCase(tempUsernameVal)) {
				result.add(tempMbAuthDto);
				tempUsernameVal = username;
				tempMbAuthDto = new MemberAuthDTO();
				tempMbAuthDto.setUsername(tempUsernameVal);
				if(dto.getAuth().equals("ROLE_MEMBER")) {
					tempMbAuthDto.setIsMember("Yes");
				}else if(dto.getAuth().equals("ROLE_ADMIN")) {
					tempMbAuthDto.setIsAdmin("Yes");
				}	
			}else {
				if(dto.getAuth().equals("ROLE_MEMBER")) {
					tempMbAuthDto.setIsMember("Yes");
				}else if(dto.getAuth().equals("ROLE_ADMIN")) {
					tempMbAuthDto.setIsAdmin("Yes");
				}				
			}
		}
		result.add(tempMbAuthDto);
		
		result.remove(0);
		
		for (MemberAuthDTO memberAuthDTO : result) {
			if(memberAuthDTO.getIsMember() == null) {
				memberAuthDTO.setIsMember("No");
			}
			if(memberAuthDTO.getIsAdmin() == null) {
				memberAuthDTO.setIsAdmin("No");
			}
		}
		
		System.out.println(result.toString());
		
		return result;
	}
	
	public List<AuthDTO> selectAuthsByUsername(String username) {
		return dao.selectAuthsByUsername(username);
	}

	public int deleteAuth(String username, String auth) {
		return dao.deleteAuth(username, auth);
	}

	public int deleteAllAuths(int uid) {
		return dao.deleteAllAuths(uid);
	}

	public int delete(UserDTO dto) {
		return dao.delete(dto);
	}
	
	public Count countByUsername(String username) {
		return dao.countByUsername(username);
	}

	public Count countByEmail(String email) {
		return dao.countByEmail(email);
	}
	
	public Integer selectUidByEmail(String email) {
		return dao.selectUidByEmail(email);
	}
	
	public int insertAuthByUsername(String username, String auth) {
		return dao.insertAuthByUsername(username, auth);
	}
	
	public List<LocalDateTime> selectRegDate(){
		List<UserDTO> list = dao.selectRegDate();
		List<LocalDateTime> result = new ArrayList<>();
		for (UserDTO dto : list) {
			result.add(dto.getRegDate());
		}
		Collections.sort(result, Collections.reverseOrder());
		return result;
	}
	
	public String generateRandomPassword() {
		StringBuffer strPwd = new StringBuffer();
		char str[] = new char[1];
		for (int i = 0; i < 12; i++) {
			str[0] = (char) ((Math.random() * 94) + 33);
			strPwd.append(str);
		}
		return strPwd.toString();
	}
	
	public List<String> getPrevMonthes(){
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<String> prevSixMonths = new ArrayList<>();		
		
		for(int i=0;i<6; i++) {
			prevSixMonths.add("\""+cal.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.KOREA)+"\"");
			cal.add(Calendar.MONTH, -1);
		}
		
		Collections.reverse(prevSixMonths);
		
		return prevSixMonths;
	}
	
	public List<Integer> countPrevMonths(List<LocalDateTime> list){
		
		List<YM> prevSixMonthsList = new ArrayList<YM>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0;i<6; i++) {
			prevSixMonthsList.add(new YM(df.format(cal.getTime()).split("-")[0],cal.getDisplayName(Calendar.MONTH,Calendar.SHORT, Locale.KOREA)));
			cal.add(Calendar.MONTH, -1);
		}
		
		
		List<YM> regDateYearMonthList = new ArrayList<YM>();
		for (LocalDateTime regDate : list) {
			regDateYearMonthList.add(new YM(Integer.toString(regDate.getYear()), regDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.KOREA)));
		}
		
		System.out.println(prevSixMonthsList);
		System.out.println(regDateYearMonthList);
		
		
		List<Integer> result = new ArrayList<Integer>();
		
		for (YM ym : prevSixMonthsList) {
			Integer cnt = 0;
			for (YM regDate  : regDateYearMonthList) {
				System.out.println(ym.toString() + " : " + regDate.toString());
				if(ym.isEqual(regDate)) {
					cnt++;
				}
				System.out.println("cnt : " + cnt);
			}
			result.add(cnt);
		}
		
		Collections.reverse(result);
		
		return result;
	}
	
	public List<Integer> sumPrevMonths(List<LocalDateTime> list){
		List<Integer> result = new ArrayList<>();
		
		List<YM> prevSixMonthsList = new ArrayList<YM>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0;i<6; i++) {
			prevSixMonthsList.add(new YM(df.format(cal.getTime()).split("-")[0],cal.getDisplayName(Calendar.MONTH,Calendar.SHORT, Locale.KOREA)));
			cal.add(Calendar.MONTH, -1);
		}
		
		return result;
	}

}

class YM{
	String year;
	String month;
	
	public YM(String year, String month) {
		this.year = year;
		this.month = month;
	}
	
	@Override
	public String toString() {
		return year + month;
	}
	
	public boolean isEqual(YM ym) {
		return this.toString().equals(ym.toString());
	}
}
