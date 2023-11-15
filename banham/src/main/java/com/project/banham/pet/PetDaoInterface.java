package com.project.banham.pet;

import java.sql.SQLException;
import java.util.ArrayList;

public interface PetDaoInterface {

	//동물 추가 관련
	int addPet(PetVO petVO) throws SQLException; // 동물 추가 버튼
	ArrayList<PetVO> petList(String owner_id); // 등록된 동물 출력
	PetVO searchPetId(String pet_id); // 동물 아이디 검색
	
	int changePetInfoNofile(String pet_name, float pet_weight,String pet_birthyear,String pet_breed,String pet_personality, String pet_id);// 동물 정보 변경 // 파일 경로 변경 값 X
	int changePetInfo(String pet_name, float pet_weight,String pet_birthyear,String pet_breed,String pet_file,String pet_personality, String pet_id);// 동물 정보 변경 // 파일 경로 변경 값 O
	int deletePetInfo(String pet_id) throws SQLException; // 동물 삭제
}
