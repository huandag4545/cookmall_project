package com.example.demo.cook_user;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;

	public void addUser(User u) {
		mapper.insertUser(u);
	}

	public User checkUserId(String user_id) {
		return mapper.selectUserId(user_id);
	}

	public User checkNickName(String user_nickname) {
		return mapper.selectUserNickName(user_nickname);
	}

	public void editUser(User u) {
		mapper.updateUser(u);
	}


	public void deleteUser(String user_id) {
		mapper.deleteUser(user_id);
	}


	public User selectUserEmail(String user_email) {
		return mapper.selectUserEmail(user_email);
	}

	public int idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}

	public int nicknameCheck(String user_nickname) {
		return mapper.nicknameCheck(user_nickname);
	}

	public int emailCheck(String user_email) {
		return mapper.emailCheck(user_email);
	}
	
	public int getTotalUserNum() {
		return mapper.getTotalUserNum();
	}
}
