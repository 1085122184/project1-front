package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Address;
import entity.Order;
import entity.Type;

@Repository
public interface address_dao {
	@Select("select * from address where user_id=#{user_id}")
    public List<Address> selectall(Address addr);	
	@Update("update address set status=1 where id=#{id} and user_id=#{user_id}")
	public void change1(Address addr);
	@Update("update address set status=0 where id<>#{id} and user_id=#{user_id}")
	public void change0(Address addr);
	@Select("select * from address where user_id=#{user_id} and id=#{id}")
	public List<Address> selectByid(Address addr);
	@Delete("delete from address where id=#{id}")
	public void del(Address addr);
	@Insert("insert into address(user_id,addr,name,tel,status,province4,city4,area4) value(#{user_id},#{addr},#{name},#{tel},0,#{province4},#{city4},#{area4})")
	public void insertaddr(Address addr);
	@Select("select * from address where user_id=#{user_id} and status=1")
	public List<Address> selectBystatus(Address addr);
	
	@Select("select * from address where id=#{address_id}")
	public Order selectid(Order o);
}

