package dto;

public class Reservation {
	

	private String pidnum;
	private String comnum;
	private String resdate;
	private String restime;
	private String comment;
	private String status;
	private String doccomment;
	private Integer id;
	
	public Reservation() {}
	public Reservation(String pidnum,String comnum,String resdate,String restime,String comment,String status,String doccomment,Integer id) {
		this.pidnum=pidnum;
		this.comnum=comnum;
		this.resdate=resdate;
		this.restime=restime;
		this.comment=comment;
		this.status=status;
		this.doccomment=doccomment;
		this.id=id;

	}
	
	
	// 예약취소
	public Reservation(Integer id, String status) {
		this.id = id;
		this.status = status;
	}
	
	// 코멘트 수정
	public Reservation(String comment, Integer id) {
		this.comment = comment;
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
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getRestime() {
		return restime;
	}
	public void setRestime(String restime) {
		this.restime = restime;
	}

	

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDoccomment() {
		return doccomment;
	}
	public void setDoccomment(String doccomment) {
		this.doccomment = doccomment;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

}

