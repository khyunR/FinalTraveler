package com.lec.spring.domain;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		System.out.println("supports(" + clazz.getName() + ")");
		return UserDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate() 호출");
		
		UserDTO dto = (UserDTO)target;
		
		String pwRegex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$";
		String emailRegex = "^(.+)@(.+)$";
		String mobileRegex = "[0-9]{3}-[0-9]{4}-[0-9]{4}";
		Pattern pattern;	
		Matcher matcher;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "emptyUsername");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "emptyPassword");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "emptyEmail");
		
		String username = dto.getUsername();
		System.out.println("validate().dto.getUsername(): " + username);
		if(username.length()>20||username.length()<4) {
			errors.rejectValue("username", "usernameLengthError");
		}
		
		
		String password = dto.getPassword();
		if(password.length()<8) {
			errors.rejectValue("password", "passwordLengthUnder8");

		}else if(password.length()>20) {
			errors.rejectValue("password", "passwordLengthOver20");			
		}else {
			System.out.println("TESTING PW REGEX...");
			pattern = Pattern.compile(pwRegex);
			matcher = pattern.matcher(password);
			if(!matcher.matches()) {
				System.out.println("PW NOT MATCHING THE PATTERN");
				errors.rejectValue("password", "passwordInvalidPattern");	
			}else {
				System.out.println("PW MATCHING THE PATTERN");
			}
		}
		
		String email = dto.getEmail();
		if(email!=null) {
			pattern = Pattern.compile(emailRegex);
			matcher = pattern.matcher(email);
			if(!matcher.matches()) {
				errors.rejectValue("email", "emailInvalidPattern");					
			}
		}
		
		String mobile = dto.getMobile();
		if(mobile!=null) {
			mobile = mobile.trim();
			if(mobile.length()!=13) {
				errors.rejectValue("mobile", "mobileLengthNotMatch");
			}else {
				pattern = Pattern.compile(mobileRegex);
				matcher = pattern.matcher(mobile);
				
				if(!matcher.matches()) {
					errors.rejectValue("mobile", "mobileInvalidPattern");
				}
			}
		}
		
	}

}
