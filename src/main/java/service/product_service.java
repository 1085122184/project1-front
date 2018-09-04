package service;

import java.util.List;

import entity.Product;

public interface product_service {
	public List<Product> selectproduct();
	public List<Product> Byid(int id);
	public List<Product> Bytypeid(Product p);
}
