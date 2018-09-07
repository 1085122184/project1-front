package service;

import java.util.List;

import entity.Orderstatus;
import entity.Shopcar;

public interface shopcar_service {
	public void addcar(Shopcar sc);
	public List<Shopcar> successadd(Shopcar sc);
	public List<Shopcar> shoppingCar(Shopcar sc);
	public List<Shopcar> ifs(Shopcar sc);
	public void addcount(Shopcar sc);
	public void del(Shopcar sc);
	public List<Shopcar> Byids(Shopcar sc);
	public List<Shopcar> sums(Shopcar sc);
	
	public List<Shopcar> count(Shopcar sc);
	 public void plus(Shopcar sc);
	 public void minus(Shopcar sc);
	 public List<Shopcar> counts(Shopcar sc);
	 
	 public void dels(Orderstatus os);
	 
	 

}
