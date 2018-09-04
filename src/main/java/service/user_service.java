package service;

import java.util.List;

import entity.User;

public interface user_service {
	public void register(User u);
	public List<User> selectByemail(User u);
	public List<User> selectByid(User u);
	public List<User> selectByuser_id(User u);
	
	
}
