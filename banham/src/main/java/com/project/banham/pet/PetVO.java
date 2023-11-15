package com.project.banham.pet;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("petVO")
public class PetVO {
	private String pet_id; // 동물 아이디
	private String pet_name; //동물 이름
	private String pet_birthyear; //동물 생년월일
	private float pet_weight; // 동물 몸무게
	private String pet_breed; // 동물 견종
	private String pet_personality; // 동물 성격
	private String pet_imgfile; // 동물 프로필 사진 주소
	private String owner_id; // uservo.userid :주인 아이디
}
