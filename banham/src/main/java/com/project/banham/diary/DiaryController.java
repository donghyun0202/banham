package com.project.banham.diary;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.banham.club.ClubVO;
import com.project.banham.user.UserVO;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diary_service;
	
	// 모임 등록 페이지 이동	
	@RequestMapping(value = "/diary/diary_write", method = RequestMethod.GET)
	public String DiaryRegisterPage(Model model) {
		return "/diary/diary_write";
	}
	
	//모임 리스트 받기
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String myDiaryList(Model model, HttpSession httpSession){
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();

		model.addAttribute("myDiaryList",diary_service.myDiaryList(user_id));
		
		return "/diary/mydiary";
	}
	
	
	@RequestMapping(value = "/diary/diaryRegSuccess", method = RequestMethod.POST)
	@ResponseBody
	public int DiaryRegService(@RequestParam("diaryTitle") String diary_title, 
			@RequestParam("diaryLocation") String diary_location,
			@RequestParam("diaryOverview") String diary_overview,
			@RequestParam("diaryCreateDate") String diary_date_create,
			HttpSession httpSession
			)  {
		
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		String user_id = vo.getUser_id();
		MyDiaryVO mydiaryVO = new MyDiaryVO();
		
		mydiaryVO.setDiary_title(diary_title);
		mydiaryVO.setDiary_location(diary_location);
		mydiaryVO.setDiary_overview(diary_overview);
		mydiaryVO.setDiary_writer(user_id);
		mydiaryVO.setDiary_date_create(diary_date_create);
		
		// 동물추가 메서드
		int result = diary_service.DiaryRegService_service(mydiaryVO);
		
		return result;
	}
	
	//게시판 아이디 검색
	@RequestMapping(value = "/diary/diary_detail", method = RequestMethod.GET)
	public String detailDiary(@RequestParam("data") String diary_id, Model model)  {
		// 동물검색 메서드
		
		model.addAttribute("detailDiary",diary_service.detailDiary(diary_id));
		 		 
		return "/diary/diary_detail";
	}
	
	
	//모임 리스트 받기
	@RequestMapping(value = "/diarylist", method = RequestMethod.GET)
	public String diarylist(Model model){

		model.addAttribute("diarylist",diary_service.diarylist());
		
		return "/diary/diary_list";
	}
	
	//나의 모임 검색
	@RequestMapping(value = "/diarySearchWrap", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<MyDiaryVO>  SearchKeywrod(@RequestParam("keyword")String keyword)  {
		
		ArrayList<MyDiaryVO> responseData = diary_service.SearchKeywrod_service(keyword);
		
		return responseData;
	}
}
