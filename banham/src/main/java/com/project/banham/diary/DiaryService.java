package com.project.banham.diary;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService {
	
	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	private DiaryDaoInterface diaryDao;

	// 나의 글 리스트 가져오기	
	public ArrayList<MyDiaryVO> myDiaryList(String user_id){ 
		diaryDao = userSqlSession.getMapper(DiaryDaoInterface.class);
	  
	  return diaryDao.myDiaryList(user_id); 
	}
	
	
	public int DiaryRegService_service(MyDiaryVO mydiaryVO) {
		diaryDao = userSqlSession.getMapper(DiaryDaoInterface.class);
		
		System.out.println(mydiaryVO);
		int result = diaryDao.DiaryRegService(mydiaryVO);
		
		return result;
	}
	
	public MyDiaryVO detailDiary(String diary_id) {
		diaryDao = userSqlSession.getMapper(DiaryDaoInterface.class);
		  
		  return diaryDao.detailDiary(diary_id); 
	}
	
	public ArrayList<MyDiaryVO> diarylist() {
		diaryDao = userSqlSession.getMapper(DiaryDaoInterface.class);
		  
		  return diaryDao.diarylist(); 
	}
	
	// 나의 글 리스트 가져오기	
	public ArrayList<MyDiaryVO> SearchKeywrod_service(String keyword){ 
		diaryDao = userSqlSession.getMapper(DiaryDaoInterface.class);
	  
	  return diaryDao.SearchKeywrod(keyword); 
	}
}
