package news.model.user;

public class User {
	private Integer id;
	private String account;
	private String password;
	private String username;
	private String auth;
	
	public User() {
		super();
	}
	
	public User(Integer id, String account, String username, String auth) {
		super();
		this.id = id;
		this.account = account;
		this.username = username;
		this.auth = auth;
	}

	public User(Integer id, String account, String password, String username,String auth) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.username = username;
		this.auth = auth;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", username=" + username + "]";
	}
}
