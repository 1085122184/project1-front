package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Order;
import entity.Orderstatus;
import entity.User;

@Repository
public interface order_dao {
   @Insert("insert into orders(date,code,amount,nowamount,address_id,user_id,status,assessstatus,comments) value(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},0,0,0)")
   public void addorders(Order o);
   
   
   
   
   @Insert("insert into orders_status(orders_id,date,dest_status,info,amount,comments) value(#{orders_id},#{date},0,#{code},0,'нч')")
   public void addstatus0(Orderstatus os);
   
   
   @Update("update orders set status=1 where id=#{id}")
   public void successpay(Order o);
   @Update("update orders set status=3 where id=#{id}")
   public void confirm(Order o);
   
   
   @Select("select * from orders where id=#{id}")
   public List<Order> select(Order o);
   
   @Select("select * from orders order by 1 desc")
   public List<Order> selectAll();
   @Select("select od.*,p.fullname,p.nowprice,p.pics from orders_details od inner join product p on p.id=od.product_id")
   public List<Order> selectdetails();
   
   @Select("select * from orders where status=0 order by 1 desc")
   public List<Order> select0();
   @Select("select od.*,p.fullname,p.nowprice,p.pics from orders_details od inner join product p on p.id=od.product_id")
   public List<Order> selectdetails0();
   
   @Select("select * from orders where status=1 order by 1 desc")
   public List<Order> select1();
   @Select("select od.*,p.fullname,p.nowprice,p.pics from orders_details od inner join product p on p.id=od.product_id")
   public List<Order> selectdetails1();
   
   @Select("select * from orders where status=2 order by 1 desc")
   public List<Order> select2();
   @Select("select od.*,p.fullname,p.nowprice,p.pics from orders_details od inner join product p on p.id=od.product_id")
   public List<Order> selectdetails2();
   
   @Select("select * from orders where status=3 order by 1 desc")
   public List<Order> select3();
   
   @Select("select od.*,p.fullname,p.nowprice,p.pics from orders_details od inner join product p on p.id=od.product_id")
   public List<Order> selectdetails3();
   
}
