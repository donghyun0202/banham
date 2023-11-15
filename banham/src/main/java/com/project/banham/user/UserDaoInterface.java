package com.project.banham.user;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface UserDaoInterface {
	
	/* 유저정보관련 */
	int regUser(UserVO userVO) throws SQLException;// 유저 회원가입 메서드
	int checkOverId(String user_id); //아이디 중복 검사
	UserVO loginUser(@Param("user_id")String user_id); //유저 로그인 메서드 
	
	String searchId(@Param("user_name")String user_name, @Param("user_phone")String user_phone); // 유저 ID 찾기
	
	//회원정보 수정 PAGE 	
	int infoCheckPw(@Param("user_id")String user_id, @Param("user_password")String user_password); // 회원정보 수정 비밀번호 확인
	int modifyEmail(@Param("user_id")String user_id, @Param("user_email")String user_email);//이메일 변경
	int modifyPhone(@Param("user_id")String user_id, @Param("user_phone")String user_email);//핸드폰 변경
	int modifyPassword(@Param("user_id")String user_id, @Param("user_password")String user_password);//비밀번호 변경

}
