package model;



public class MemberDTO {
		private int member_idx;
		private String email;
		private String nickname;
		private String password;
		private String regdate;

		
		  
		// 기본 생성자
	    public MemberDTO() {
	        this.member_idx = 0;
	        this.email = "";
	        this.nickname = "";
	        this.password = "";
	        this.regdate = null; 
	    }

	    // 모든 필드를 사용하는 생성자
	    public MemberDTO(int member_Idx, String email, String nickname, String password, String regdate) {
	        this.member_idx = member_Idx;
	        this.email = email;
	        this.nickname = nickname;
	        this.password = password;
	        this.regdate = regdate;
	    }

	    // 이메일, 닉네임, 비밀번호를 사용하는 생성자
	    public MemberDTO(String email, String nickname, String password) {
	        this.email = email;
	        this.nickname = nickname;
	        this.password = password;
	    }
		
		
		public int getMember_idx() {
			return member_idx;
		}
		public void setMember_idx(int member_idx) {
			this.member_idx = member_idx;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		

		
}
