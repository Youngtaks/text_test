package model;

public class DTO {
    private String area_code;
    private String area_name;
    private String city_code;
    private String city_name;
    private String city_tel1;
    private String city_tel2;
    private String city_tel3;
    private String city_admin;
    private String city_level;
    private String test_date;
    private String test_ampm;
    private String pollution;
    private int test_value;//

    // 추가 필드
    private int tot_test_value; // 일자별 측정 값 합산
    private int cnt_city;
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getCity_code() {
		return city_code;
	}
	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getCity_tel1() {
		return city_tel1;
	}
	public void setCity_tel1(String city_tel1) {
		this.city_tel1 = city_tel1;
	}
	public String getCity_tel2() {
		return city_tel2;
	}
	public void setCity_tel2(String city_tel2) {
		this.city_tel2 = city_tel2;
	}
	public String getCity_tel3() {
		return city_tel3;
	}
	public void setCity_tel3(String city_tel3) {
		this.city_tel3 = city_tel3;
	}
	public String getCity_admin() {
		return city_admin;
	}
	public void setCity_admin(String city_admin) {
		this.city_admin = city_admin;
	}
	public String getCity_level() {
		return city_level;
	}
	public void setCity_level(String city_level) {
		this.city_level = city_level;
	}
	public String getTest_date() {
		return test_date;
	}
	public void setTest_date(String test_date) {
		this.test_date = test_date;
	}
	public String getTest_ampm() {
		return test_ampm;
	}
	public void setTest_ampm(String test_ampm) {
		this.test_ampm = test_ampm;
	}
	public String getPollution() {
		return pollution;
	}
	public void setPollution(String pollution) {
		this.pollution = pollution;
	}
	public int getTest_value() {
		return test_value;
	}
	public void setTest_value(int test_value) {
		this.test_value = test_value;
	}
	public int getTot_test_value() {
		return tot_test_value;
	}
	public void setTot_test_value(int tot_test_value) {
		this.tot_test_value = tot_test_value;
	}
	public int getCnt_city() {
		return cnt_city;
	}
	public void setCnt_city(int cnt_city) {
		this.cnt_city = cnt_city;
	}

    
    
}
