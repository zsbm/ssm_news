package news.model.news;

public class NewsDTO {
	private int id;
	private String title;
	private String content;
	private String createDate;
	private String username;
	private Integer type;
	
	public NewsDTO() {
		super();
	}

	public NewsDTO(int id, String title, String content, String createDate, String username) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.username = username;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public String getUsername() {
		return username;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "NewsDTO [id=" + id + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", username=" + username + "]";
	}
}
