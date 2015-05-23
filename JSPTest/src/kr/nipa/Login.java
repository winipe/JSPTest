package kr.nipa;

import javax.validation.constraints.*;

public class Login {
	@NotNull
	private String id;
	
	@NotNull
	private String name;
	
	@NotNull
	private String email;
	
	@NotNull
	@Size(min=6, max=20)
	private String password;

	public Login() {}
	
	public String getId() {
		return this.id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
