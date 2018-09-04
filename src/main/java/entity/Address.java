package entity;

public class Address {

	int id;
	int user_id;
	String province4;
	String city4;
	String area4;
	String addr;
	String name;
	String tel;
	int status;
	public static String[] statuss= {"设为默认","默认地址"};
	public static String[] statuses= {"选择该地址","目前地址"};
	
	public String getStatus_name() {
		return statuss[status];
	}
	public String getStatusname() {
		return statuses[status];
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




	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

}
