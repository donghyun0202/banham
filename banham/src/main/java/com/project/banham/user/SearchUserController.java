package com.project.banham.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchUserController {

	@Autowired
	private SearchUserService searchUserService;

	
	// 아이디 찾기
	@RequestMapping(value = "/user/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName") String user_name, 
			@RequestParam("inputPhone") String user_phone) {
		
		String result = searchUserService.get_searchId(user_name, user_phone);

		return result;
	}
	
}