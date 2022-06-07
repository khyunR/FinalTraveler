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
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentDTO {
	
	private int uid;   // uid
	private int mb_uid;
	private int accommo_uid;
	private String username;
	private String content;
	// java.time.* 객체 변환을 위한 annotation
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private LocalDateTime regDate;  // wr_regdate
	
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
			return String.format("CommentDTO] %d: %s : %s", 
					uid, content, regDate);
		}
	
}








