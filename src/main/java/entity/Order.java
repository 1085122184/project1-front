package entity;

public class Order {
	int id;
	String code;
	String date;
	double amount;
	double nowamount;
	int address_id;
	int user_id;
	int status;
	int assessstatus;
	String comments;
	String province4;
	String city4;
	String area4;
	String addr;
	String name;
	String tel;
	public static String[] statuss = {"未支付","已支付","已发货","已收货","申请退货","已退货","已拒绝退货"};
	public static String[] assessstatuss = {"未评价","已评价"};
	
	
	String fullname;
	double nowprice;
	String pics;
	int count;
	int orders_id;
	
	public int getOrders_id() {
		return orders_id;
	}


	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getPic() {
		if(pics.length()<5)return null;
		String [] pic=pics.split(",");
		
		if(pic.length>0)
		return pic[0];
		else return null;
	}
	
	
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public double getNowprice() {
		return nowprice;
	}

	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getStatus_name() {
		return statuss[status];
	}

	public String getAssessstatus_name() {
		return assessstatuss[assessstatus];
	}
	
	
	
	
	
	public String getProvince4() {
		return province4;
	}
	public void setProvince4(String province4) {
		this.province4 = province4;
	}
	public String getCity4() {
		return city4;
	}
	public void setCity4(String city4) {
		this.city4 = city4;
	}
	public String getArea4() {
		return area4;
	}
	public void setArea4(String area4) {
		this.area4 = area4;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAssessstatus() {
		return assessstatus;
	}
	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	
	
}
