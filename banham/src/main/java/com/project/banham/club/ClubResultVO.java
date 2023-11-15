package com.project.banham.club;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("clubresultVO")
public class ClubResultVO {
	private String club_id;  //모임 아이디
	private String club_title; //모임 제목
	private String club_date; // 모임 날짜
	private int club_person; // 모임 인원
	private String club_deadline; //모임 마감일
	private String club_pet; //모임 반려견
	private String club_location; //모임 장소
	private String club_overview; //모임 추가사항
	private String club_status; //모임 상태[progress,end]
	private String club_writer; //모임 작성자
	private String club_date_create; //등록일
	private int apply_id; // 신청 아이디
	private String user_id; // 신청자 아이디
	private String apply_status; // 신청 상태
	private String pet_id; // 동물 아이디
}
