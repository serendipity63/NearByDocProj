package dto;

public class Patient {
	private String pidnum;
	private String pemail;
	private String ppassword;
	private String date;
	private String time;
	private String pname;
	private String number;
	private String ptel;
	private String paddress;

	public Patient() {}
	public Patient(String pidnum, String pemail, String ppassword, String date, String time, String pname,
			String number, String ptel, String paddress) {
		this.pidnum = pidnum;
		this.pemail = pemail;
		this.ppassword = ppassword;
		this.date = date;
		this.time = time;
		this.pname = pname;
		this.number = number;
		this.ptel = ptel;
		this.paddress = paddress;
	}

	public String getPidnum() {
		return pidnum;
	}

	public void setPidnum(String pidnum) {
		this.pidnum = pidnum;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPtel() {
		return ptel;
	}

	public void setPtel(String ptel) {
		this.ptel = ptel;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

}
