package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;


import entity.Product;

@Repository
public interface product_dao {
	@Select("select p.*,t.name tname from product p inner join type t on t.id=p.type_id")
	public List<Product> selectproduct();
    @Select("select * from product where id=#{id}")
	public List<Product> Byid(int id);
    @Select("select * from product where type_id=#{type_id}")
    public List<Product> Bytypeid(Product p);
    
    
    
}
