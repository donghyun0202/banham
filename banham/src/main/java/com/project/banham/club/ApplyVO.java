package com.project.banham.club;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("applyVO")
public class ApplyVO {
	private int apply_id; // 신청 아이디
	private String club_id; // 모임 아이디
	private String user_id; // 신청자 아이디
	private String apply_status; // 신청 상태
	private String pet_id; // 동물 아이디
}
