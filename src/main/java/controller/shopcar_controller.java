package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;
import entity.Order;
import entity.Orderdatails;
import entity.Orderstatus;
import entity.Product;
import entity.Shopcar;
import entity.User;
import jsonInfo.jsonInfo;
import service.address_service;
import service.order_service;
import service.orderdetails_service;
import service.product_service;
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
@Autowired
product_service pservice;
@Autowired
order_service oservice;
@Autowired
orderdetails_service otservice;

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
	@RequestMapping("plus")
	public @ResponseBody jsonInfo plus(Shopcar sc) {
		service.plus(sc);
		return new  jsonInfo(1, "");
	}
	@RequestMapping("minus")
	public @ResponseBody jsonInfo minus(Shopcar sc) {
		service.minus(sc);
		return new  jsonInfo(1, "");
	}
	
	@RequestMapping("pay")
	public String pay(User u,ModelMap m,Address addr,Shopcar sc,Product p,String ids,HttpServletRequest req) {
		m.put("ids", ids);
		List<Shopcar> counts=service.counts(sc);
		List<Product> prices=pservice.Byids(p);
		String cs = "";
		String ps="";
		String nps="";
		for(int i=0;i<counts.size();i++){
		cs+=counts.get(i).getCount()+",";
		ps+=prices.get(i).getPrice()+",";
		nps+=prices.get(i).getNowprice()+",";
		}
		cs = cs.substring(0,cs.lastIndexOf(','));
		ps = ps.substring(0,ps.lastIndexOf(','));
		nps = nps.substring(0,nps.lastIndexOf(','));
		req.getSession().setAttribute("counts", cs);
		req.getSession().setAttribute("prices", ps);
		req.getSession().setAttribute("nowprices", nps);
		req.getSession().setAttribute("pids",p.getPids());
		m.put("user",uservice.selectByid(u).get(0));
		m.put("address", addrservice.selectall(addr));
     	m.put("products",service.Byids(sc));
		m.put("sums", service.sums(sc).get(0));
		m.put("faultaddr", addrservice.selectBystatus(addr).get(0));
		return "home/pay";
	} 
	@RequestMapping("order")
	public @ResponseBody jsonInfo order(ModelMap m,String product_id,String countss,String nprice,String price,Order o,HttpServletRequest req,String ids) {
               String []  product_ids=product_id.split(",");
                String []  counts=countss.split(",");
                String []  nowprices=nprice.split(",");
                String []  prices=price.split(",");
                Date d = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String date = sdf.format(d);
                String code = d.getTime()+""+o.getUser_id();
                o.setCode(code);
                o.setDate(date);
                req.getSession().setAttribute("code",code);
                req.getSession().setAttribute("addr",addrservice.selectid(o));
                req.getSession().setAttribute("amount",o.getNowamount());
                oservice.addorders(o);
                int orders_id=otservice.selectIdentity();
                req.getSession().setAttribute("orders_id",orders_id);
                Orderdatails ot = new Orderdatails();
                Orderstatus os=new Orderstatus();
                for(int i=0;i<product_ids.length;i++) {
                	double p=Double.parseDouble(prices[i]);
                	double np=Double.parseDouble(nowprices[i]);
                	int c=Integer.parseInt(counts[i]);
                	int pid=Integer.parseInt(product_ids[i]);
                	ot.setC(c);
                	ot.setNp(np);
                	ot.setP(p);
                	ot.setPid(pid);
                	ot.setOrders_id(orders_id);
                	otservice.insert(ot);
                 }
                os.setCode(code);
                os.setDate(date);
                os.setOrders_id(orders_id);
                os.setProduct_id(ids);
                oservice.addstatus0(os);
                service.dels(os);
                
		
                return new  jsonInfo(1, "");
	} 
	
}
