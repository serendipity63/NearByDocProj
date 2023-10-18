package dto;

import java.sql.Timestamp;

public class Review {
	private String pidnum;
	private String comnum;
	private String content;
	private String star;
	private Timestamp birth;
	private Integer id;
	
	public Review() {}
	public Review(String pidnum, String comnum,String content,String star,Timestamp birth, Integer id) {
		this.pidnum=pidnum;
		this.comnum=comnum;
		this.content=content;
		this.star=star;
		this.birth=birth;
		this.id = id;
	}
	public String getPidnum() {
		return pidnum;
	}
	public void setPidnum(String pidnum) {
		this.pidnum = pidnum;
	}
	public String getComnum() {
		return comnum;
	}
	public void setComnum(String comnum) {
		this.comnum = comnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
