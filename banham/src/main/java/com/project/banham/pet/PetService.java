package com.project.banham.pet;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetService {
	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	private PetDaoInterface petDao;
	// 동물 추가 서비스
	public int petReg_service(PetVO petVO) {

		int resultCnt = 0;

		petDao = userSqlSession.getMapper(PetDaoInterface.class);
		
		try {
			resultCnt = petDao.addPet(petVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	public ArrayList<PetVO> petList(String owner_id) {
		
		petDao = userSqlSession.getMapper(PetDaoInterface.class);
		
		
		return petDao.petList(owner_id);
	}
	
	public PetVO searchPetId(String pet_id) {
		
		petDao = userSqlSession.getMapper(PetDaoInterface.class);
		
		
		return petDao.searchPetId(pet_id);
	}
	
	// 동물 변경 서비스
	public int changePetInfo_service(String pet_name, float pet_weight,String pet_birthyear,String pet_breed,String pet_file,String pet_personality, String pet_id) {

		int resultCnt = 0;

		petDao = userSqlSession.getMapper(PetDaoInterface.class);
		

		if (pet_file == "") {
			resultCnt = petDao.changePetInfoNofile(pet_name, pet_weight, pet_birthyear, pet_breed, pet_personality, pet_id);
		}else {
			resultCnt = petDao.changePetInfo(pet_name, pet_weight, pet_birthyear, pet_breed, pet_file, pet_personality, pet_id);
		}

		return resultCnt;
	}
	
	// 동물 삭제 서비스	
	public int deletePetInfo_service(String pet_id) {

		int resultCnt = 0;

		petDao = userSqlSession.getMapper(PetDaoInterface.class);
		
		try {
			resultCnt = petDao.deletePetInfo(pet_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
}
