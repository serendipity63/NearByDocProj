package dto;

public class Patient {
	private String pemail;
	private String ppassword;
	private String pname;
	private Integer ptel;
	private Integer pidnum;
	private String paddress;

	public Patient() {

	}

	public Patient(String pemail, String ppassword, String pname, Integer ptel, Integer pidnum, String paddress) {
		this.pemail = pemail;
		this.ppassword = ppassword;
		this.pname = pname;
		this.ptel = ptel;
		this.pidnum = pidnum;
		this.paddress = paddress;
	}

	public String getPemail() {
		return pemail;
	}

	public void setPemail(String pemail) {
		this.pemail = pemail;
	}

	public String getPpassword() {
		return ppassword;
	}

	public void setPpassword(String ppassword) {
		this.ppassword = ppassword;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getPtel() {
		return ptel;
	}

	public void setPtel(Integer ptel) {
		this.ptel = ptel;
	}

	public Integer getPidnum() {
		return pidnum;
	}

	public void setPidnum(Integer pidnum) {
		this.pidnum = pidnum;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

}
