package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.shopcar_dao;
import entity.Shopcar;
import service.shopcar_service;
@Service
public class shopcar_serviceImpl implements shopcar_service {
@Autowired
shopcar_dao dao;
	public void addcar(Shopcar sc) {
		dao.addcar(sc);
		
	}
	public List<Shopcar> successadd(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.successadd(sc);
	}
	public List<Shopcar> shoppingCar(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.shoppingCar(sc);
	}
	public List<Shopcar> ifs(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.ifs(sc);
	}
	public void addcount(Shopcar sc) {
		dao.addcount(sc);
	}
	public void del(Shopcar sc) {
		dao.del(sc);
		
	}
	public List<Shopcar> Byids(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.Byids(sc);
	}
	public List<Shopcar> sums(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.sums(sc);
	}
	public List<Shopcar> count(Shopcar sc) {
		// TODO Auto-generated method stub
		return dao.count(sc);
	}
	public void plus(Shopcar sc) {
		dao.plus(sc);
		
	}
	public void minus(Shopcar sc) {
		dao.minus(sc);
		
	}
	

}
