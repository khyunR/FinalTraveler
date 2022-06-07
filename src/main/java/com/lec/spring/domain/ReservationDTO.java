package com.lec.spring.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ReservationDTO {
	private int uid;
	private int mb_uid;
	private int accommo_uid;
	private String resDate;
	private String accommoName;
	
	public ReservationDTO() {
		System.out.println("ResrvationDTO() 생성");
	}
}
