package service;

import java.util.List;

import entity.Product;
import entity.Type;

public interface type_service {
	 public List<Type> selectall();
	 public List<Type> selectByid(int id);
}
