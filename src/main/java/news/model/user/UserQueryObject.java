package news.model.user;

public class UserQueryObject {
	private String id;
	private String account;
	private String username;
	private String auth;
	
	public UserQueryObject() {
		super();
	}

	public UserQueryObject(String id, String account, String username, String auth) {
		super();
		this.id = id;
		this.account = account;
		this.username = username;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
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
}
