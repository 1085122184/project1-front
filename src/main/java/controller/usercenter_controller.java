package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;

import entity.Product;
import entity.User;
import jsonInfo.JsonUtil;
import jsonInfo.jsonInfo;
import service.address_service;
import service.product_service;
import service.type_service;
import service.user_service;

@Controller
@RequestMapping("User")
public class usercenter_controller {
	@Autowired
	user_service uservice;
    @Autowired
    address_service addrservice;
    
    

	@RequestMapping("center")
    public String selectAll(ModelMap m,User u) {
		return "User/index";
	}
    @RequestMapping("addr")
    public String address(ModelMap m,Address addr,User u) {
    	m.put("address",addrservice.selectall(addr));
    	return "User/address";
    }
    @RequestMapping("change")
    public @ResponseBody List<Address> change(Address addr,ModelMap m,User u) {
    	addrservice.change0(addr);
    	addrservice.change1(addr);
        List<Address> list = addrservice.selectByid(addr);
    	return list;
    }
    @RequestMapping("del")
    public @ResponseBody jsonInfo del(Address addr){
    	addrservice.del(addr);
    	return new  jsonInfo(1, "");
    } 
    @RequestMapping("insertaddr")
    public @ResponseBody jsonInfo insertaddr(Address addr){
    	addrservice.insertaddr(addr);
    	return new  jsonInfo(1, "");
    } 
    
	
}
