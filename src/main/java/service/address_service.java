package service;

import java.util.List;

import entity.Address;
import entity.Type;
import entity.User;

public interface address_service {
	public List<Address> selectall(Address addr);
	public void change1(Address addr);
	public void change0(Address addr);
	public List<Address> selectByid(Address addr);
	public void del(Address addr);
	public void insertaddr(Address addr);
	public List<Address> selectBystatus(Address addr);
}
