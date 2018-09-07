package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.shopcar_dao;
import entity.Order;
import entity.Orderdatails;
import entity.Product;
import entity.Shopcar;
import entity.User;
import jsonInfo.jsonInfo;
import service.order_service;
import service.orderdetails_service;
import service.product_service;
import service.type_service;
import service.user_service;

@Controller
@RequestMapping("home")
public class pay_controller {
	@Autowired
	orderdetails_service odservice;
	@Autowired
	product_service pservice;
	@Autowired
	order_service oservice;
	@RequestMapping("payment")
	public @ResponseBody jsonInfo payment(Order o) {
		oservice.successpay(o);
		return new  jsonInfo(o.getId(), "");
	}
	
	@RequestMapping("confirm")
	public @ResponseBody jsonInfo confirm(Order o) {
		oservice.confirm(o);
		return new  jsonInfo(o.getId(), "");
	}
	
	@RequestMapping("myorder")
	public String myorder(ModelMap m) {
		m.put("orderlist",oservice.selectAll());
		m.put("details", oservice.selectdetails());
		//未付款 status=0
		m.put("orderlist0",oservice.select0());
		m.put("details0", oservice.selectdetails0());
		
		//等待发货 status=1
		m.put("orderlist1",oservice.select1());
		m.put("details1", oservice.selectdetails1());
		System.out.println(oservice.selectdetails1().size());
		
		
		//等待收货 status=2
		m.put("orderlist2",oservice.select2());
		m.put("details2", oservice.selectdetails2());
		
		//交易完成
		
		m.put("orderlist3",oservice.select3());
		m.put("details3", oservice.selectdetails3());
		
		
		
		
		
		
		return "User/myorder";
	}
	
	
	
	}
	

