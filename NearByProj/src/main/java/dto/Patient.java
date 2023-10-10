package dto;

public class Patient {
	private String pemail;
	private String ppassword;
	private String pname;
	private String ptel;
	private String pidnum;
	private String proadaddress;
	private String ppostcode;
	private String pdetailaddress;

	public Patient() {

	}

	public Patient(String pemail, String ppassword, String pname, String ptel, String pidnum, String proadaddress,
			String ppostcode, String pdetailaddress) {
		this.pemail = pemail;
		this.ppassword = ppassword;
		this.pname = pname;
		this.ptel = ptel;
		this.pidnum = pidnum;
		this.proadaddress = proadaddress;
		this.ppostcode = ppostcode;
		this.pdetailaddress = pdetailaddress;
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

	public String getPtel() {
		return ptel;
	}

	public void setPtel(String ptel) {
		this.ptel = ptel;
	}

	public String getPidnum() {
		return pidnum;
	}

	public void setPidnum(String pidnum) {
		this.pidnum = pidnum;
	}

	public String getProadaddress() {
		return proadaddress;
	}

	public void setProadaddress(String proadaddress) {
		this.proadaddress = proadaddress;
	}

	public String getPpostcode() {
		return ppostcode;
	}

	public void setPpostcode(String ppostcode) {
		this.ppostcode = ppostcode;
	}

	public String getPdetailaddress() {
		return pdetailaddress;
	}

	public void setPdetailaddress(String pdetailaddress) {
		this.pdetailaddress = pdetailaddress;
	}

}
