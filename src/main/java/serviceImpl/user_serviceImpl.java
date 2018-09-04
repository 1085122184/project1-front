package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user_dao;
import entity.User;
import service.user_service;
@Service
public class user_serviceImpl implements user_service{
    @Autowired
    user_dao dao;

	public void register(User u) {
      dao.register(u);
	}

	public List<User> selectByemail(User u) {
		// TODO Auto-generated method stub
		return dao.selectByemail(u);
	}

	public List<User> selectByid(User u) {
		// TODO Auto-generated method stub
		return dao.selectByid(u);
	}

	public List<User> selectByuser_id(User u) {
		// TODO Auto-generated method stub
		return dao.selectByuser_id(u);
	}

	


}
