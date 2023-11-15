package com.project.banham.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	private UserDaoInterface userDao;

	// 회원가입 서비스
	public int userReg_service(UserVO userVO) {

		int resultCnt = 0;

		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		
		try {
			resultCnt = userDao.regUser(userVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	// 중복 아이디 체크
	public int userIdCheck(String user_id) {

		userDao = userSqlSession.getMapper(UserDaoInterface.class);

		return userDao.checkOverId(user_id);
	}
	
	// 로그인
	public int userLogin_service(UserVO userVO, HttpSession httpSession) {

		System.out.println("UserLoginService // 로그인 객체 확인 userVO : " + userVO);
		String user_id = userVO.getUser_id();
		String user_pw = userVO.getUser_password();

		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		UserVO vo = userDao.loginUser(user_id);
//		StoreVO storeVO = userDao.getUserStoreVO(store_id);

		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		int result = 0;

		// 회원 정보가 없을 시
		if (vo == null) {
			result = 0;
			return result;
		}

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번,스토어id가 모두 같은경우
			System.out.println("1단계");
			System.out.println(vo.getUser_id());
			System.out.println(user_id);
			System.out.println(vo.getUser_password());
			System.out.println(user_pw);
			if (vo.getUser_id().equals(user_id) && vo.getUser_password().equals(user_pw)) {

				System.out.println("2단계-로그인단계");
				// 세션 저장하기 전에 비밀번호 가리기
				vo.setUser_password("");

				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));

				result = 1;
			}
		}

		return result;
	}
	
	// 회원정보 체크
	public int infoCheck_password(String user_id, String user_password) {
		System.out.println("222222222222222" + user_id);
		System.out.println("2222222222222" + user_password);
		userDao = userSqlSession.getMapper(UserDaoInterface.class);

		return userDao.infoCheckPw(user_id, user_password);
	}
	
	//회원정보 수정 이메일
	public int infomodify_email(UserVO userVO, HttpSession httpSession, String user_id, String user_email) {
		//결과 초기화
		int emailresult = 0;
		
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		emailresult = userDao.modifyEmail(user_id, user_email);
		
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		vo.setUser_email(user_email);
		
		System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));
		return emailresult;
		
		
	}
	
	//회원정보 수정 연락처
	public int infomodify_phone(UserVO userVO, HttpSession httpSession, String user_id, String user_phone) {
		//결과 초기화
		int phoneresult = 0;
		
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		phoneresult = userDao.modifyPhone(user_id, user_phone);
		
		UserVO vo = (UserVO)httpSession.getAttribute("userSession");
		vo.setUser_phone(user_phone);
		
		System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));
		return phoneresult;
		
		
	}
	
	//회원정보 수정 비밀번호
	public int infomodify_password(UserVO userVO, HttpSession httpSession, String user_id, String user_password) {
		//결과 초기화
		int passwordresult = 0;
		
		userDao = userSqlSession.getMapper(UserDaoInterface.class);
		
		passwordresult = userDao.modifyPassword(user_id, user_password);

		return passwordresult;
		
	}
		
}
