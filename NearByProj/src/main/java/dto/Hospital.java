package dto;

public class Hospital {
	private String hname;
	private String hpassword;
	private String comnum;
	private String hemail;
	private String haddress;
	private String htel;
	private String department;

	public Hospital() {

	}

	public Hospital(String hname, String hpassword, String comnum, String hemail, String haddress, String htel,
			String department) {
		this.hname = hname;
		this.hpassword = hpassword;
		this.comnum = comnum;
		this.hemail = hemail;
		this.haddress = haddress;
		this.htel = htel;
		this.department = department;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getComnum() {
		return comnum;
	}

	public void setComnum(String comnum) {
		this.comnum = comnum;
	}

	public String getHemail() {
		return hemail;
	}

	public void setHemail(String hemail) {
		this.hemail = hemail;
	}

	public String getHaddress() {
		return haddress;
	}

	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}

	public String getHtel() {
		return htel;
	}

	public void setHtel(String htel) {
		this.htel = htel;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getHpassword() {
		return hpassword;
	}

	public void setHpassword(String hpassword) {
		this.hpassword = hpassword;
	}

}
