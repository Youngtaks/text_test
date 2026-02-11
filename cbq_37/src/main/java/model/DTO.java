package model;

public class DTO {
	String cust_no;
	String cust_name;
	String cust_tele;
	String resv_no;
	String resv_date;
	String court_no;
	String used_flag;
	int u_days;
	public int getU_days() {
		return u_days;
	}
	public void setU_days(int u_days) {
		this.u_days = u_days;
	}
	public String getCust_no() {
		return cust_no;
	}
	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_tele() {
		return cust_tele;
	}
	public void setCust_tele(String cust_tele) {
		this.cust_tele = cust_tele;
	}
	public String getResv_no() {
		return resv_no;
	}
	public void setResv_no(String resv_no) {
		this.resv_no = resv_no;
	}
	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}
	public String getCourt_no() {
		return court_no;
	}
	public void setCourt_no(String court_no) {
		this.court_no = court_no;
	}
	public String getUsed_flag() {
		return used_flag;
	}
	public void setUsed_flag(String used_flag) {
		this.used_flag = used_flag;
	}
}
