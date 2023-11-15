package com.project.banham.diary;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface DiaryDaoInterface {

	//나의글 리스트 가져오기
	ArrayList<MyDiaryVO> myDiaryList(String diary_writer);
	int DiaryRegService(MyDiaryVO mydiaryVO); //글등록
	
	MyDiaryVO detailDiary(@Param("diary_id")String diary_id); // 글 아이디 검색
	
	ArrayList<MyDiaryVO> diarylist();
	
	ArrayList<MyDiaryVO> SearchKeywrod(String keyword);
}
