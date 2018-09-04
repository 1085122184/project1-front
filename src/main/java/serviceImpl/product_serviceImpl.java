package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product_dao;
import entity.Product;
import service.product_service;
@Service
public class product_serviceImpl implements product_service{
	@Autowired
	product_dao dao;

	public List<Product> selectproduct() {
		return dao.selectproduct();
	}

	public List<Product> Byid(int id) {
		return dao.Byid(id);
	}

	public List<Product> Bytypeid(Product p) {
		// TODO Auto-generated method stub
		return dao.Bytypeid(p);
	}



}
