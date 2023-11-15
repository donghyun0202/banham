package com.project.banham.club;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.banham.pet.PetVO;

public interface ClubDaoInterface {
	
	//모임 등록 관련
	int clubReg(ClubVO clubVO) throws SQLException; // 모임등록 버튼
	
	//모임 deadline 업데이트 - > status 업데이트
	void updatedeadline();
	void updateApplyDeadline();
	//모임 리스트 가져오기
	ArrayList<ClubVO> clubboardList();
	
	ClubVO searchBoardId(String club_id); // 게시판 아이디 검색
	ArrayList<ApplyVO> applyResult(String club_id);//게시판 신청 목록 가져오기
	
	int clubApply(ApplyVO applyVO) throws SQLException; // 모임신청 버튼
	int searchApplyId(@Param("club_id")String club_id, @Param("user_id")String user_id) throws SQLException; // 모임신청 확인 버튼
	int deleteClub(@Param("club_writer")String club_writer, @Param("club_id")String club_id, @Param("club_title")String club_title, @Param("club_overview")String club_overview)throws SQLException; // 모임신청 확인 버튼
	PetVO selectPetIDandOwnerId(@Param("owner_id")String owner_id, @Param("pet_id")String pet_id);
	
	ArrayList<ClubVO> myclubList(@Param("club_writer")String club_writer);//myclub
	
	ArrayList<ClubResultVO> applyclubList(@Param("user_id")String user_id);//applyClub
	
	int updateClubStatus(@Param("user_id")String user_id, @Param("club_id")String club_id, @Param("apply_status")String apply_status)throws SQLException; //신청 변경
	
	ArrayList<ClubVO> SearchResult(String keyword); //검색
	
	ArrayList<ClubVO> myclubSearchList(@Param("club_writer")String club_writer,@Param("keyword")String keyword);//myclub 검색
	
	ArrayList<ClubResultVO> applyclubSearchList(@Param("user_id")String user_id,@Param("keyword")String keyword);//applyClub  검색
}
