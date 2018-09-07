package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.address_dao;
import dao.product_dao;
import entity.Address;
import entity.Order;
import entity.Product;
import entity.Type;
import service.address_service;
import service.product_service;
@Service
public class address_serviceImpl implements address_service{
@Autowired
address_dao dao;
	public List<Address> selectall(Address addr) {
		// TODO Auto-generated method stub
		return dao.selectall(addr);
	}
	public void change1(Address addr) {
		dao.change1(addr);
		
	}
	public void change0(Address addr) {
		dao.change0(addr);
		
	}
	public List<Address> selectByid(Address addr) {
		// TODO Auto-generated method stub
		return dao.selectByid(addr);
	}
	public void del(Address addr) {
		dao.del(addr);
		
	}
	public void insertaddr(Address addr) {
		dao.insertaddr(addr);
		
	}
	public List<Address> selectBystatus(Address addr) {
		// TODO Auto-generated method stub
		return dao.selectBystatus(addr);
	}
	public Order selectid(Order o) {
		// TODO Auto-generated method stub
		return dao.selectid(o);
	}

}
