package com.itwillbs.bean;

/**
 * 	ID, password, birthday 저장하는 객체(javaBean)
 */
public class JavaBean2 {
	
	private String id;
	private String password;
	private String birth;
	
	//public JavaBean2 {} 생성자 생략
	
	// option + shift + r
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	// option + shift + s
	@Override
	public String toString() {
		return "JavaBean2 [id=" + id + ", password=" + password + ", birth=" + birth + "]";
	}
	
	
	
}
