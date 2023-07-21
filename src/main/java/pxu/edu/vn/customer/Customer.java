package pxu.edu.vn.customer;

import java.util.Date;

public class Customer {
	private int user_id;
	private String username;
	private String password;
	private String email;
	private String phone;
	private String full_name;
	private String gender;
	private String role;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(int user_id, String username, String password, String email, String phone, String full_name,
			String gender, String role) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.full_name = full_name;
		this.gender = gender;
		this.role = role;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Customer [user_id=" + user_id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", full_name=" + full_name + ", gender=" + gender + ", role=" + role + "]";
	}

}
