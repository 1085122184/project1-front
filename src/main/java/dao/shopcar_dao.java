package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Product;
import entity.Shopcar;

@Repository
public interface shopcar_dao {
    @Insert("insert into shopcar(user_id,product_id,count) value(#{user_id},#{product_id},#{count})")
	public void addcar(Shopcar sc);
    @Select("select sc.*,p.fullname,p.pics from shopcar sc inner join product p on p.id=sc.product_id where sc.product_id=#{product_id}")
    public List<Shopcar> successadd(Shopcar sc);
    @Select("select sc.*,p.* from shopcar sc inner join product p on p.id=sc.product_id where sc.user_id=#{user_id}")
    public List<Shopcar> shoppingCar(Shopcar sc);
    @Select("select * from shopcar where product_id=#{product_id} and user_id=#{user_id}")
    public List<Shopcar> ifs(Shopcar sc);
    @Update("update shopcar set count=#{count} where id=#{id}")
    public void addcount(Shopcar sc);
    @Delete("delete from shopcar where id=#{id}")
    public void del(Shopcar sc);
    @Select("select sc.*,p.fullname,p.pics,p.nowprice from shopcar sc inner join product p on p.id=sc.product_id where sc.id in(${ids})")
    public List<Shopcar> Byids(Shopcar sc);
    @Select("select sum(sc.count*p.nowprice) totalmoney,sum(sc.count*p.price) oldtotalmoney from shopcar sc inner join product p on p.id=sc.product_id where sc.id in(${ids})")
    public List<Shopcar> sums(Shopcar sc);
    
    @Select("select count(id) c from shopcar where user_id=#{user_id}")
    public List<Shopcar> count(Shopcar sc);
    @Update("update shopcar set count=count+1 where id=#{id}")
    public void plus(Shopcar sc);
    @Update("update shopcar set count=count-1 where id=#{id}")
    public void minus(Shopcar sc);
}
