package com.project.banham.pet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.banham.user.UserVO;

@Controller
public class PetController {
	//동물 추가
	@Autowired
	private PetService pet_service;
	
	private static final String UPLOAD_DIR = "/var/lib/tomcat9/webapps/upload/";
//	private static final String UPLOAD_DIR = "E:\\Test";
	// 동물 컨트롤러
	@RequestMapping(value = "/mypage/addMyPet", method = RequestMethod.POST)
	@ResponseBody
	public int petRegPass(@RequestParam("petName") String pet_name, @RequestParam("petWeight") float pet_weight,
			@RequestParam("petBirthyear") String pet_birthyear,
			@RequestParam("petBreed") String pet_breed,
			@RequestParam("petFile") MultipartFile file,
			@RequestParam("petPersonality") String pet_personality,
			@RequestParam("ownerId")String owner_id) {
		String uploadDir = UPLOAD_DIR + "/" + owner_id;
        File uploadDirectory = new File(uploadDir);

        // 디렉토리가 없으면 생성
        if (!uploadDirectory.exists()) {
             uploadDirectory.mkdirs();
        }
		String fileresult = "";
		
		if (!file.isEmpty()) {
            try {
                // 업로드할 파일명 설정
                String fileName = file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir, fileName);

                // 파일을 업로드
                Files.write(filePath, file.getBytes());

                // 업로드된 파일의 경로 반환
                fileresult = filePath.toString();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            fileresult = "";
        }
		
		fileresult="";
		
		PetVO petVO = new PetVO();
		petVO.setPet_name(pet_name);
		petVO.setPet_weight(pet_weight);
		petVO.setPet_birthyear(pet_birthyear);
		petVO.setPet_breed(pet_breed);
		petVO.setPet_imgfile(fileresult);
		petVO.setPet_personality(pet_personality);
		petVO.setOwner_id(owner_id);
		// 동물추가 메서드
		int result = pet_service.petReg_service(petVO);
		
		return result;
	}
	
	
	/* private static final String UPLOAD_DIR = "E:\\Test"; */

	/*
	 * @RequestMapping(value = "/upload", method = RequestMethod.POST) public
	 * ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
	 * if (!file.isEmpty()) { try { // 업로드할 파일명 설정 String fileName =
	 * file.getOriginalFilename(); Path filePath = Paths.get(UPLOAD_DIR, fileName);
	 * 
	 * // 파일을 업로드 Files.write(filePath, file.getBytes());
	 * 
	 * // 업로드된 파일의 경로 반환 return ResponseEntity.ok(filePath.toString()); } catch
	 * (IOException e) { e.printStackTrace(); return
	 * ResponseEntity.status(500).body("File upload failed: " + e.getMessage()); } }
	 * else { return ResponseEntity.badRequest().body("File is empty."); } }
	 */
	
	@RequestMapping(value = "/petList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<PetVO> printpetList(UserVO userVO, HttpSession httpSession) throws IOException {
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String owner_id = vo.getUser_id();
		System.out.println(owner_id);
		ArrayList<PetVO> petresult = pet_service.petList(owner_id);
		
		return petresult;
	}

	
	@RequestMapping(value = "/selectPetID", method = RequestMethod.GET)
	@ResponseBody
	public PetVO searchPetId(@RequestParam("petID")String pet_id) throws IOException {
		
		PetVO searchResult = pet_service.searchPetId(pet_id);
		return searchResult;
	}
	
	//동물 변경	
	@RequestMapping(value = "/mypage/changePetInfo", method = RequestMethod.POST)
	@ResponseBody
	public int ChangePetInfo(@RequestParam("ChangepetName") String pet_name, @RequestParam("ChangepetWeight") float pet_weight,
			@RequestParam("ChangepetBirthyear") String pet_birthyear,
			@RequestParam("ChangepetBreed") String pet_breed,
			@RequestParam("ChangepetFile") String pet_file,
			@RequestParam("ChangepetPersonality") String pet_personality,
			@RequestParam("petId")String pet_id) {
		
		int result = pet_service.changePetInfo_service(pet_name, pet_weight, pet_birthyear, pet_breed, pet_file, pet_personality, pet_id);

		return result;
	}

	//동물 삭제	
	@RequestMapping(value = "/mypage/deletePetInfo", method = RequestMethod.POST)
	@ResponseBody
	public int DeletePetInfo(@RequestParam("pet_id")String pet_id) {
		
		int result = pet_service.deletePetInfo_service(pet_id);

		return result;
	}

}
