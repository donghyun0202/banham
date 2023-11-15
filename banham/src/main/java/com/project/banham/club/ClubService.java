package com.project.banham.club;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.banham.pet.PetVO;

@Service
public class ClubService {
	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	private ClubDaoInterface clubDao;
	
	
	// 모임등록 서비스
	public int clubReg_service(ClubVO clubVO) {

		int resultCnt = 0;

		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		try {
			resultCnt = clubDao.clubReg(clubVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	
	
	  //deadline -> status 업데이트
	public void updateApplyDeadline() { 
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
	  
		clubDao.updateApplyDeadline(); 
	}
	
	public void updateDeadline() { 
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
	  
		clubDao.updatedeadline(); 
	}
	  
	  
	public ArrayList<ClubVO> clubboardList(){ 
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
	  
	  return clubDao.clubboardList(); 
	}
	
	public ClubVO searchBoardId_service(String club_id) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.searchBoardId(club_id);
	}
	
	public ArrayList<ApplyVO> applyResult_service(String club_id) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.applyResult(club_id);
	}
	
	// 모임신청 서비스
	public int clubApply_service(ApplyVO applyVO) {

		int resultCnt = 0;

		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		try {
			resultCnt = clubDao.clubApply(applyVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}

	// 모임신청 서비스
	public int searchApplyId_service(String club_id, String user_id) {

		int resultCnt = 0;

		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		try {
			resultCnt = clubDao.searchApplyId(club_id, user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	// 모임신청 서비스
	public int deleteClub_service(String user_id, String club_id, String club_title, String club_overview) {

		int resultCnt = 0;

		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		try {
			resultCnt = clubDao.deleteClub(user_id, club_id, club_title, club_overview);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	//동물검색
	public PetVO selectPetIDandOwnerId_service(String owner_id, String pet_id) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.selectPetIDandOwnerId(owner_id, pet_id);
	}
	
	//myClub
	public ArrayList<ClubVO> myclubList(String club_writer) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.myclubList(club_writer);
	}
	
	//ApplyVO
	public ArrayList<ClubResultVO> applyclubList(String user_id) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.applyclubList(user_id);
	}
	
	
	public int updateClubStatus_service(String user_id, String club_id, String apply_status) {
		int resultCnt = 0;

		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		try {
			resultCnt = clubDao.updateClubStatus(user_id, club_id, apply_status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	//모임 검색
	public ArrayList<ClubVO> SearchResult_service(String keyword) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.SearchResult(keyword);
	}
	
	//myClub 검색
	public ArrayList<ClubVO> myclubSearchList(String club_writer, String keyword) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.myclubSearchList(club_writer, keyword);
	}
	
	//ApplyVO 검색
	public ArrayList<ClubResultVO> applyclubSearchList(String user_id, String keyword) {
		clubDao = userSqlSession.getMapper(ClubDaoInterface.class);
		
		return clubDao.applyclubSearchList(user_id, keyword);
	}
}
