package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface user_dao {
    @Insert("insert into user(email,password,level,amount,status,tel) value(#{email},#{password},0,0,0,#{tel})")
	public void register(User u);
    @Select("select * from user where email=#{email}")
    public List<User> selectByemail(User u);
    @Select("select * from user where id=#{id}")
    public List<User> selectByid(User u);
    @Select("select * from user where id=#{user_id}")
    public List<User> selectByuser_id(User u);
}
