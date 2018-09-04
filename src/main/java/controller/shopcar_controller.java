package controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;
import entity.Product;
import entity.Shopcar;
import entity.User;
import jsonInfo.jsonInfo;
import service.address_service;
import service.shopcar_service;
import service.user_service;

@Controller
@RequestMapping("home")
public class shopcar_controller {
@Autowired
shopcar_service service;
@Autowired
user_service uservice;
@Autowired
address_service addrservice;
	@RequestMapping("addcar")
	public String addcar(Shopcar sc,ModelMap m) {
		if(service.ifs(sc).size()==0) {
			service.addcar(sc);
		}else if(service.ifs(sc).size()>0){
			Shopcar info=service.ifs(sc).get(0);
			info.setCount(info.getCount()+sc.getCount());
            service.addcount(info);
		}
		return successadd(m, sc);
	}
	@RequestMapping("successadd")
	public String successadd(ModelMap m,Shopcar sc) {
		m.put("success",service.successadd(sc).get(0));
		return "home/successadd";
	}
	@RequestMapping("shopcarpay")
    public String shoppingCar(ModelMap m,Shopcar sc) {
		m.put("shopcar",service.shoppingCar(sc));
		m.put("size",service.shoppingCar(sc).size());
		return "home/shoppingCar";
	}
	
	@RequestMapping("failedadd")
	public String failedadd() {
		return "home/successadd";
	}
	
	@RequestMapping("delcar")
	public @ResponseBody jsonInfo del(Shopcar sc) {
		service.del(sc);
		return new  jsonInfo(1, "");
	}
	@RequestMapping("pay")
	public String pay(User u,ModelMap m,Address addr,Shopcar sc,String ids,String counts,String nowprices,String prices) {
		m.put("ids", ids);
		m.put("counts", counts);
		m.put("nowprices",nowprices);
		m.put("prices", prices);
		m.put("user",uservice.selectByid(u).get(0));
		m.put("address", addrservice.selectall(addr));
		m.put("products",service.Byids(sc));
		m.put("sums", service.sums(sc).get(0));
		m.put("faultaddr", addrservice.selectBystatus(addr).get(0));
		return "home/pay";
	} 
	@RequestMapping("order")
	public String oeder(User u,ModelMap m,Address addr,String product_id,String count,String nowprice,String price) {
                String []  product_ids=product_id.split(",");
                String []  counts=count.split(",");
                String []  nowprices=nowprice.split(",");
                String []  prices=price.split(",");
                for(int i=0;i<product_ids.length;i++) {
                	
                	
                }
		
		return "home/order";
	} 
	
}
