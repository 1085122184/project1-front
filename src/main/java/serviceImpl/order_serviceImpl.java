package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.address_dao;
import dao.order_dao;
import dao.product_dao;
import entity.Address;
import entity.Order;
import entity.Orderstatus;
import entity.Product;
import entity.Type;
import service.address_service;
import service.order_service;
import service.product_service;
@Service
public class order_serviceImpl implements order_service{
	@Autowired
	order_dao dao;

	public void addorders(Order o) {
	 dao.addorders(o);
		
	}

	public void addstatus0(Orderstatus os) {
		dao.addstatus0(os);
		
	}

	public void successpay(Order o) {
		dao.successpay(o);
		
	}

	public List<Order> select(Order o) {
		// TODO Auto-generated method stub
		return dao.select(o);
	}

	public List<Order> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	public List<Order> selectdetails() {
		// TODO Auto-generated method stub
		return dao.selectdetails();
	}

	public List<Order> select0() {
		// TODO Auto-generated method stub
		return dao.select0();
	}

	public List<Order> selectdetails0() {
		// TODO Auto-generated method stub
		return dao.selectdetails0();
	}

	public List<Order> select1() {
		// TODO Auto-generated method stub
		return dao.select1();
	}

	public List<Order> selectdetails1() {
		// TODO Auto-generated method stub
		return dao.selectdetails1();
	}

	public List<Order> select2() {
		// TODO Auto-generated method stub
		return dao.select2();
	}

	public List<Order> selectdetails2() {
		// TODO Auto-generated method stub
		return dao.selectdetails2();
	}

	public List<Order> select3() {
		// TODO Auto-generated method stub
		return dao.select3();
	}

	public List<Order> selectdetails3() {
		// TODO Auto-generated method stub
		return dao.selectdetails3();
	}

	public void confirm(Order o) {
		dao.confirm(o);
		
	}

	
	
	
}
