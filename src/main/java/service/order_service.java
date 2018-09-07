package service;

import java.util.List;

import entity.Address;
import entity.Order;
import entity.Orderstatus;
import entity.Type;
import entity.User;

public interface order_service {
	public void addorders(Order o);
	public void addstatus0(Orderstatus os);
	public void successpay(Order o);
	public void confirm(Order o);
	public List<Order> select(Order o);
	
	
	public List<Order> selectAll();
	public List<Order> selectdetails();
	
	public List<Order> select0();
    public List<Order> selectdetails0();
    public List<Order> select1();
    public List<Order> selectdetails1();
    public List<Order> select2();
    public List<Order> selectdetails2();
    
    public List<Order> select3();
    public List<Order> selectdetails3();
}
