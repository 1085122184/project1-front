package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.address_dao;
import dao.order_dao;
import dao.orderdetails_dao;
import dao.product_dao;
import entity.Address;
import entity.Order;
import entity.Orderdatails;
import entity.Product;
import entity.Type;
import service.address_service;
import service.order_service;
import service.orderdetails_service;
import service.product_service;
@Service
public class orderdetails_serviceImpl implements orderdetails_service{
	@Autowired
	orderdetails_dao dao;

	public void insert(Orderdatails ot) {
		dao.insert(ot);
		
	}

	public int selectIdentity() {
		// TODO Auto-generated method stub
		return dao.selectIdentity();
	}


	

	

	

	
	
	
}
