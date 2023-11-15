package com.project.banham.user;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("userVO")
public class UserVO {
	private String user_id; //회원 아이디
	private String user_password; //회원 비밀번호
	private String user_name; //회원 이름
	private String user_birthyear; //회원 생년월일
	private String user_email; //회원 이메일
	private String user_phone; //회원 핸드폰 번호
	private String user_gender; //회원 성별
}
