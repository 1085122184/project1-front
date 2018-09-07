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
	@Select("select p.*,t.name tname from product p inner join type t on t.id=p.type_id where p.status=0")
	public List<Product> selectproduct();
    @Select("select * from product where id=#{id}")
	public List<Product> Byid(int id);
    @Select("select * from product where type_id=#{type_id} and status=0")
    public List<Product> Bytypeid(Product p);
    @Select("select * from product where id in(${pids})")
    public List<Product> Byids(Product p);
    
    
    @Update("update product set salecount=salecount+#{count} where id=#{id}")
    public void payment(Product p);
    
}
