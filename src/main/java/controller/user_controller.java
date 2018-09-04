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
import entity.Product;
import entity.Shopcar;
import entity.User;
import jsonInfo.jsonInfo;
import service.product_service;
import service.type_service;
import service.user_service;

@Controller
@RequestMapping("home")
public class user_controller {
	@Autowired
	user_service uservice;
	@Autowired
	product_service pservice;
    @Autowired
	type_service tservice;
    @Autowired
    shopcar_dao scservice;

	
    @RequestMapping("register")
	public @ResponseBody jsonInfo register(User u) {
 		uservice.register(u);
 		return new jsonInfo(1, "");
	}
    @RequestMapping("login")
    public String login(User u,ModelMap m,HttpServletRequest req,Shopcar sc){
		List<User> emails=uservice.selectByemail(u);
		if(emails.size()>0&&emails.get(0).getPassword().equals(u.getPassword())) {
			req.getSession().setAttribute("user",uservice.selectByemail(u).get(0));
			sc.setUser_id(uservice.selectByemail(u).get(0).getId());
			req.getSession().setAttribute("count",scservice.count(sc).get(0));
			req.getSession().setAttribute("msg", "");
			m.put("product",pservice.selectproduct());
			m.put("type", tservice.selectall());
			return "home/index";
			}
		else {
			req.getSession().setAttribute("msg", "用户名或密码错误请重新输入！");
			return "home/login";
			
		}
	}
	@RequestMapping("goshopping")
	public String goshopping(ModelMap m,Product p,User u) {
		m.put("product",pservice.selectproduct());
		m.put("type", tservice.selectall());
		return "home/index";
	}
	@RequestMapping("off")
	public String off(ModelMap m,HttpServletRequest req) {
		req.getSession().removeAttribute("user");
		req.getSession().removeAttribute("count");
		req.getSession().setAttribute("msg", "");
		m.put("product",pservice.selectproduct());
		m.put("type", tservice.selectall());
		return "home/index";
    	
	}
	
}
