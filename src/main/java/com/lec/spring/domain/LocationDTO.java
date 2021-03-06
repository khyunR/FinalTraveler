package com.lec.spring.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LocationDTO {
	
	private int uid; 
	private int mb_uid;
	private String username;
	private String subject;
	private String category;
	private String locationName;
	private String locationAddr;
	private String homepage;
	private String businessHour;
	private String phoneNo;
	private String fee;
	private String imageFilePaths;
	private String content;
	private int viewCnt;
	private LocalDateTime regDate;
	
}
