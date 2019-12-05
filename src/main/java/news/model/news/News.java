package news.model.news;

import news.model.user.User;

public class News {
//	private int id;
	private Integer id;
	private String title;
	private String content;
	private String createDate;
//	private int userId;
//	private int type;
	private Integer userId;
	private Integer type;
	private User user;
	
	public News() {
		super();
	}
	
	public News(Integer id, String title, String content, String createDate, Integer userId, Integer type) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.userId = userId;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", userId=" + userId + ", type=" + type + ", user=" + user + "]";
	}
}
