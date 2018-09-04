package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Type;

@Repository
public interface type_dao {
	@Select("select * from type")
    public List<Type> selectall();	
	@Select("select * from type where id=#{id}")
	public List<Type> selectByid(int id);
}

