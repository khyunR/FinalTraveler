package com.lec.spring.domain;

import java.util.concurrent.ThreadLocalRandom;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmailDTO {
	private String address;
	private String subject;
	private String content;
}

