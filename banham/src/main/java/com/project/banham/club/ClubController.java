package com.project.banham.club;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.banham.pet.PetVO;
import com.project.banham.user.UserVO;

@Controller
public class ClubController {
	//클럽 서비스
	@Autowired
	private ClubService club_service;
	
	// 모임 등록 페이지 이동	
	@RequestMapping(value = "/club/club_register", method = RequestMethod.GET)
	public String clubRegisterPage(Model model) {
		return "/club/club_register";
	}
	
	//모임 등록
	@RequestMapping(value = "/club/clubApplySuccess", method = RequestMethod.POST)
	@ResponseBody
	public int clubApply(@RequestParam("club_title") String club_title, 
			@RequestParam("club_writer") String club_writer,
			@RequestParam("club_date") String club_date,
			@RequestParam("club_person") int club_person,
			@RequestParam("club_deadline") String club_deadline,
			@RequestParam("club_pet") String club_pet,
			@RequestParam("club_location") String club_location,
			@RequestParam("club_overview") String club_overview,
			@RequestParam("club_status") String club_status,
			@RequestParam("club_date_create") String club_date_create)  {
		ClubVO clubVO = new ClubVO();
		
		clubVO.setClub_title(club_title);
		clubVO.setClub_writer(club_writer);
		clubVO.setClub_date(club_date);
		clubVO.setClub_person(club_person);
		clubVO.setClub_deadline(club_deadline);
		clubVO.setClub_pet(club_pet);
		clubVO.setClub_location(club_location);
		clubVO.setClub_overview(club_overview);
		clubVO.setClub_status(club_status);
		clubVO.setClub_date_create(club_date_create);
		
		// 동물추가 메서드
		int result = club_service.clubReg_service(clubVO);
		
		return result;
	}
	
	
	//모임 리스트 받기
	@RequestMapping(value = "/club")
	public String ClubBoardList(Model model){
		
		club_service.updateDeadline();
		club_service.updateApplyDeadline();
		model.addAttribute("clubboardList",club_service.clubboardList());
		
		return "/club/club";
	}
	
	
	//게시판 아이디 검색
	@RequestMapping(value = "/club/clubboard", method = RequestMethod.GET)
	public String SearchBoardID(@ModelAttribute("clubVO") ClubVO clubVO, @ModelAttribute("ApplyVO") ClubVO applyVO, @RequestParam("boardID") String club_id, Model model)  {
		// 동물검색 메서드
		
		  ClubVO result = club_service.searchBoardId_service(club_id);
		  ArrayList<ApplyVO> applyresult = club_service.applyResult_service(club_id);
		  model.addAttribute("clubSearchId", result);
		  model.addAttribute("applyList", applyresult);
		 
		return "/club/clubboard";
	}
	
	//모임 신청
	@RequestMapping(value = "/club/clubApply", method = RequestMethod.POST)
	@ResponseBody
	public int clubApply(@RequestParam("select_pet")String pet_id,
			@RequestParam("clubID")String club_id , 
			HttpSession httpSession)  {

		ApplyVO applyVO = new ApplyVO();
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		
		applyVO.setPet_id(pet_id);
		applyVO.setUser_id(user_id);
		applyVO.setApply_status("waiting");
		applyVO.setClub_id(club_id);
		
		// 동물추가 메서드
		int result = club_service.clubApply_service(applyVO);
		
		return result;
	}
	
	
	//모임 게시판 확인
	@RequestMapping(value = "/searchApplyId", method = RequestMethod.GET)
	@ResponseBody
	public int searchApplyId(@RequestParam("clubId")String club_id , HttpSession httpSession)  {
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		
		// 신청 확인 메서드
		int result = club_service.searchApplyId_service(club_id, user_id);
		
		return result;
	}
		
	//모임 삭제
	@RequestMapping(value = "/deleteClub", method = RequestMethod.POST)
	@ResponseBody
	public int deleteClub(@RequestParam("clubId")String club_id, HttpSession httpSession)  {
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		
		String club_title = "작성자에 의해 삭제된 모임입니다.";
		String club_overview = "작성자에 의해 삭제된 모임입니다.";
		// 동물추가 메서드
		int result = club_service.deleteClub_service(user_id, club_id, club_title, club_overview);
		
		return result;
	}
	
	//동물 검색
	@RequestMapping(value = "/selectPetIDandOwnerId", method = RequestMethod.GET)
	@ResponseBody
	public PetVO selectPetIDandOwnerId(@RequestParam("ownerID")String owner_id, @RequestParam("petID")String pet_id)  {
		
		PetVO result = club_service.selectPetIDandOwnerId_service(owner_id,pet_id);
		
		return result;
	}
	
	//나의 모임 가져오기
	@RequestMapping(value = "/myclubList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object>  MyClubList(HttpSession httpSession)  {
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		club_service.updateDeadline();
		club_service.updateApplyDeadline();
		
		Map<String, Object> responseData = new HashMap<>();
        responseData.put("myclub", club_service.myclubList(user_id));
        responseData.put("applyclub", club_service.applyclubList(user_id));
        
		return responseData;
	}
	
	
	//모임 신청 결과
	@RequestMapping(value = "/updateclubResult", method = RequestMethod.POST)
	@ResponseBody
	public int updateClubStatus(@RequestParam("user_id")String user_id, 
								@RequestParam("club_id")String club_id, 
								@RequestParam("select_value")String apply_status)  {
		
		// 모임 신청 결과
		int result = club_service.updateClubStatus_service(user_id, club_id, apply_status);
		
		return result;
	}
	
	//나의 모임 검색
	@RequestMapping(value = "/SearchResult", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ClubVO>  SearchResult(@RequestParam("keyword")String keyword)  {
		
		ArrayList<ClubVO> responseData = club_service.SearchResult_service(keyword);
		
		return responseData;
	}
	
	//나의 모임 검색
	@RequestMapping(value = "/mySearchResult", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object>  MyClubSearchList(@RequestParam("keyword")String keyword, HttpSession httpSession)  {
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		
		Map<String, Object> responseData = new HashMap<>();
		ArrayList<ClubVO> myclubList = club_service.myclubSearchList(user_id, keyword);
		ArrayList<ClubResultVO> applyclubList = club_service.applyclubSearchList(user_id, keyword);
        responseData.put("myclub", myclubList);
        responseData.put("applyclub", applyclubList);
        
		return responseData;
	}
	
}
