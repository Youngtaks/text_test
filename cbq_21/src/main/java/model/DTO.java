package model;

public class DTO {
	String registration_code;
	String name;
	String birth_day;
	String height;
	String weight;
	
	int game_numbers;
	int appearance;
	int hit_numbers;
	int home_runs;
	int put_out;
	int double_play;
	int error_count;
	public String getRegistration_code() {
		return registration_code;
	}
	public void setRegistration_code(String registration_code) {
		this.registration_code = registration_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public int getGame_numbers() {
		return game_numbers;
	}
	public void setGame_numbers(int game_numbers) {
		this.game_numbers = game_numbers;
	}
	public int getAppearance() {
		return appearance;
	}
	public void setAppearance(int appearance) {
		this.appearance = appearance;
	}
	public int getHit_numbers() {
		return hit_numbers;
	}
	public void setHit_numbers(int hit_numbers) {
		this.hit_numbers = hit_numbers;
	}
	public int getHome_runs() {
		return home_runs;
	}
	public void setHome_runs(int home_runs) {
		this.home_runs = home_runs;
	}
	public int getPut_out() {
		return put_out;
	}
	public void setPut_out(int put_out) {
		this.put_out = put_out;
	}
	public int getDouble_play() {
		return double_play;
	}
	public void setDouble_play(int double_play) {
		this.double_play = double_play;
	}
	public int getError_count() {
		return error_count;
	}
	public void setError_count(int error_count) {
		this.error_count = error_count;
	}
	public int getSubi_point() {
		return subi_point;
	}
	public void setSubi_point(int subi_point) {
		this.subi_point = subi_point;
	}
	public double getApoint() {
		return apoint;
	}
	public void setApoint(double apoint) {
		this.apoint = apoint;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	int subi_point;
	double apoint;
	int grade;
	int rank;
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
}
