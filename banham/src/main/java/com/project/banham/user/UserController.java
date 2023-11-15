package com.project.banham.user;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	
	//회원가입
	@Autowired
	private UserService reg_service;
	
	//로그인
	@Autowired
	private UserService login_service;
		
	//회원정보 수정 비밀번호 확인	
	@Autowired
	private UserService info_service;
	
	// Home의 Login 페이지 이동
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String userLogin() {
		return "/user/login";
	}
	
	// Home의 join 페이지 이동
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String userJoin() {
		return "/user/join";
	}
	
	// Home의 idpwfind 페이지 이동
	@RequestMapping(value = "/user/idpwfind", method = RequestMethod.GET)
	public String findIdPw() {
		return "/user/idpwfind";
	}
	
	// Home의 mypage 페이지 이동
		@RequestMapping(value = "/mypage/mypage", method = RequestMethod.GET)
		public String mypage() {
			return "/mypage/mypage";
		}
		
	// 회원가입 컨트롤러
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String userRegPass(UserVO userVO) {
		// 암호 확인
		System.out.println("첫번째:" + userVO.getUser_password());
		// 비밀번호 암호화 (sha256)
		String encryPassword = UserSha256.encrypt(userVO.getUser_password());
		userVO.setUser_password(encryPassword);
		System.out.println("두번째:" + userVO.getUser_password());
		// 회원가입 메서드
		reg_service.userReg_service(userVO);
		// 인증 메일 보내기 메서드
		//mailsender.mailSendWithUserKey(userVO.getUser_email(), userVO.getUser_id());
		
		return "redirect:/";
	}	
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {
		return reg_service.userIdCheck(user_id);
	}
	
	//로그인	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	@ResponseBody
	public int userLoingPass(UserVO userVO, HttpSession httpSession) {
		// 비밀번호 암호화
		String user_password = userVO.getUser_password();
		userVO.setUser_password(UserSha256.encrypt(user_password));

		// 암호화 확인
		System.out.println("user_password : " + userVO.getUser_password());
		// 로그인 메서드
		int result = login_service.userLogin_service(userVO, httpSession);


		return result;
	}
	
	//로그아웃	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 수정 비밀번호 확인
	@RequestMapping(value = "/user/infoCheckPw", method = RequestMethod.POST)
	@ResponseBody
	public int infoCheckPw(@RequestParam("userId") String user_id,@RequestParam("userPw") String user_password) {
		// 로그인 메서드
		int inforesult = info_service.infoCheck_password(user_id, UserSha256.encrypt(user_password));

		return inforesult;
	}
	
	
	// 회원정보 수정
	// 이메일
	@RequestMapping(value = "/user/infoModifyEmail", method = RequestMethod.POST)
	@ResponseBody
	public int infoModifyEmail(UserVO userVO, HttpSession httpSession,@RequestParam("userId") String user_id,@RequestParam("userEmail") String user_email) {
		// 이메일 변경
		int emailresult = info_service.infomodify_email(userVO, httpSession, user_id, user_email);

		return emailresult;
	}
	
	// 연락처
	@RequestMapping(value = "/user/infoModifyPhone", method = RequestMethod.POST)
	@ResponseBody
	public int infoModifyPhone(UserVO userVO, HttpSession httpSession,@RequestParam("userId") String user_id,@RequestParam("userPhone") String user_phone) {
		// 연락처 변경
		int phoneresult = info_service.infomodify_phone(userVO, httpSession, user_id, user_phone);

		return phoneresult;
	}
	
	// 비밀번호
	@RequestMapping(value = "/user/infoModifyPassword", method = RequestMethod.POST)
	@ResponseBody
	public int infoModifyPassword(UserVO userVO, HttpSession httpSession,@RequestParam("userId") String user_id,@RequestParam("userPassword") String user_password) {
		// 비밀번호 변경
		int passwordresult = info_service.infomodify_password(userVO, httpSession, user_id, UserSha256.encrypt(user_password));

		return passwordresult;
	}
}
