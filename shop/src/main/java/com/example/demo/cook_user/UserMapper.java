package com.example.demo.cook_user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	void insertUser(User u);

	User selectUserId(String user_id);

	User selectUserNickName(String user_nickname);

	void updateUser(User u);

	void updateUserScore(Map map);

	void deleteUser(String id);
	
	int getTotalUserNum();

	int idCheck(String user_id);

	int nicknameCheck(String user_nickname);

	int emailCheck(String user_email);

	User selectUserEmail(String user_email);
	
}
