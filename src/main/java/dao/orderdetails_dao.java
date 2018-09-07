package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Orderdatails;
import entity.User;

@Repository
public interface orderdetails_dao {
    @Insert("insert into orders_details(orders_id,product_id,count,price,nowprice,comments) value(#{orders_id},#{pid},#{c},#{p},#{np},0)")
    public void insert(Orderdatails ot);
   
    @Select("SELECT @@IDENTITY AS 'Identity'")
    public int selectIdentity();
    

    
  
}
