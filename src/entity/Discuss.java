package entity;

import java.util.Date;

public class Discuss {
	private String uid;//主键
	private String user_id;//评论的用户
	private Date createTime;
	private String content;
	private Long agree;//赞
	private Long disagree;//踩
	private String article_id;//评论的文章的id
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Long getAgree() {
		return agree;
	}
	public void setAgree(Long agree) {
		this.agree = agree;
	}
	public Long getDisagree() {
		return disagree;
	}
	public void setDisagree(Long disagree) {
		this.disagree = disagree;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	@Override
	public String toString() {
		return "Discuss [uid=" + uid + ", user_id=" + user_id + ", createTime=" + createTime + ", content=" + content
				+ ", agree=" + agree + ", disagree=" + disagree + ", article_id=" + article_id + "]";
	}
	
}
