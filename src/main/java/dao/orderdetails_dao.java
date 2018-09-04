package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface orderdetails_dao {
    @Insert("insert into user(email,password,level,amount,status) value(#{email},#{password},0,0,0)")
	public void register(User u);
   
}
