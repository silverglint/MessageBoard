package entity;

import java.util.Date;

public class Article {
	private String uid;//主键
	private String header;//文章标题
	private String name;//文字名称
	private String content;//内容
	private String description;//内容简述
	private Integer deleted;//0 未删除，1 已删除
	private Date createTime;//创建时间
	private Date lastUpdate;//最后修改时间
	private String user_id;//作者id
	private String classify_id;//分类id
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClassify_id() {
		return classify_id;
	}
	public void setClassify_id(String classify_id) {
		this.classify_id = classify_id;
	}
	@Override
	public String toString() {
		return "Article [uid=" + uid + ", header=" + header + ", name=" + name + ", content=" + content
				+ ", description=" + description + ", deleted=" + deleted + ", createTime=" + createTime
				+ ", lastUpdate=" + lastUpdate + ", user_id=" + user_id + ", classify_id=" + classify_id + "]";
	}
	
	
}
