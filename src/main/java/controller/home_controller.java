package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Product;
import jsonInfo.jsonInfo;
import service.product_service;
import service.type_service;

@Controller
@RequestMapping("home")
public class home_controller {
    @Autowired
	product_service pservice;
    @Autowired
	type_service tservice;
    
    
    
    @RequestMapping("indexs")
	public String select(ModelMap m) {
		m.put("product",pservice.selectproduct());
		m.put("type", tservice.selectall());
		return "home/index";
		
	}
    
	
	@RequestMapping("view")
	public String view(int id,ModelMap m) {
		m.put("list",pservice.Byid(id).get(0));
		return "home/introduction";
		
	}
	
	@RequestMapping("upview")
	public String upview(int id,ModelMap m) {
		m.put("list",pservice.Byid(id).get(0));
		return "home/introduction";
		
	}
	@RequestMapping("search")
	public String search(ModelMap m,Product p,int id) {
		m.put("product",pservice.Bytypeid(p));
		m.put("type", tservice.selectall());
		m.put("typename",tservice.selectByid(id).get(0));
		return "home/search";
		
	}

	
	
	
	
}
