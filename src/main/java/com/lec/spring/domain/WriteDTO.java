package com.lec.spring.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

//DTO : Data Transfer Object
//DAO 등과 연동하여 데이터를 실어 나르는 객체
//필요한 객체(entity) 만큼 작성
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WriteDTO {
	private int uid;    //  wr_uid
	private String subject;  // wr_subject
	private String content;  // wr_content
	private String name;     // wr_name
	private int viewCnt;  // wr_viewcnt
	
	// java.time.* 객체 변환을 위한 annotation
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private LocalDateTime regDate;  // wr_regdate
	
	// 웹개발시...
	// 가능한, 다음 3가지는 이름을 일치시켜주는게 좋습니다.
	// 클래스 필드명 = DB 필드명 = form의 name명

	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	// LocalDateTime 을 String 으로 리턴하는 getter
	@JsonIgnore
	public String getRegDateTime() {
		if(this.regDate == null) return "";
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

	// 개발할때 class 의 toString() 을 오버라이딩 해주면
	// 웹에 표현하거나, 디버깅이나 테스팅 하기 좋다.
	@Override
	public String toString() {
		return String.format("WriteDTO] %d: %s : %s : %s : %d : %s", 
				uid, subject, content, name, viewCnt, regDate);
	}
	
	
	
	
} // end DTO









