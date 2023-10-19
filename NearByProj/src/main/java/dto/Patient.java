package dto;

public class Patient {
	
	private String pemail;
	private String pidnum;
	private String ppassword;
	private String pname;
	private String ptel;
	private String proadaddress;
	private String ppostcode;
	private String pdetailaddress;
	private Boolean quit;
	private String ppidnum;

	public Patient() {}

	public Patient(String pemail, String ppassword, String pname, String ptel, String pidnum, String proadaddress,
			String ppostcode, String pdetailaddress, Boolean quit, String ppidnum) {
		
		this.pemail = pemail;
		this.pidnum = pidnum;
		this.ppassword = ppassword;
		this.pname = pname;
		this.ptel = ptel;
		this.proadaddress = proadaddress;
		this.ppostcode = ppostcode;
		this.pdetailaddress = pdetailaddress;
		this.quit = quit;
		this.ppidnum = ppidnum;
	}
	
	// 개인정보 수정위한 생성자
	public Patient(String pname,String ptel,String pemail, String ppassword, String proadaddress, String pidnum) {
		this.pname = pname;
		this.ptel = ptel;
		this.pemail = pemail;
		this.ppassword = ppassword;
		this.proadaddress = proadaddress;
		this.pidnum = pidnum;
	}
	
	// 가족 추가 생성자
	public Patient(String pidnum, String pname, String ptel, String proadaddress, String ppidnum) {
		this.pidnum = pidnum;
		this.pname = pname;
		this.ptel = ptel;
		this.proadaddress = proadaddress;
		this.ppidnum = ppidnum;
	}
	
	// 가족 정보 수정 생성자
	public Patient(String pname, String ptel, String proadaddress, String pidnum) {
		this.pname = pname;
		this.ptel = ptel;
		this.proadaddress = proadaddress;
		this.pidnum = pidnum;
		
	}

	public String getPemail() {
		return pemail;
	}

	public void setPemail(String pemail) {
		this.pemail = pemail;
	}

	public String getPidnum() {
		return pidnum;
	}

	public void setPidnum(String pidnum) {
		this.pidnum = pidnum;
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

	public String getProadaddress() {
		return proadaddress;
	}

	public void setProadaddress(String proadaddress) {
		this.proadaddress = proadaddress;
	}

	public Boolean getQuit() {
		return quit;
	}

	public void setQuit(Boolean quit) {
		this.quit = quit;
	}

	public String getPpidnum() {
		return ppidnum;
	}

	public void setPpidnum(String ppidnum) {
		this.ppidnum = ppidnum;
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