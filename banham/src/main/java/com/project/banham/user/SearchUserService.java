package com.project.banham.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchUserService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDaoInterface userDao;

	// 아이디 찾기
	public String get_searchId(String user_name, String user_phone) {

		userDao = sqlSession.getMapper(UserDaoInterface.class);
		
		String result = "";

		try {
			result = userDao.searchId(user_name, user_phone);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
}
