package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product_dao;
import dao.type_dao;
import entity.Product;
import entity.Type;
import service.product_service;
import service.type_service;
@Service
public class type_serviceImpl implements type_service{
	@Autowired
	type_dao dao;

	public List<Type> selectall() {
		return dao.selectall();
	}

	public List<Type> selectByid(int id) {
		// TODO Auto-generated method stub
		return dao.selectByid(id);
	}


}
