package dto;

public class Family {
	private String fidnum;
	private String fname;
	private String ftel;
	private String pidnum;
	private String faddress;
	
	public Family() {}
	public Family(String fidnum,String fname,String ftel,String pidnum,String faddress) {
		this.fidnum=fidnum;
		this.fname=fname;
		this.ftel=ftel;
		this.pidnum=pidnum;
		this.faddress=faddress;
	}
	
	public Family(String fname, String ftel, String faddress, String fidnum) {
		this.fname = fname;
		this.ftel = ftel;
		this.faddress = faddress;
		this.fidnum = fidnum;
	}
	public String getFidnum() {
		return fidnum;
	}
	public void setFidnum(String fidnum) {
		this.fidnum = fidnum;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFtel() {
		return ftel;
	}
	public void setFtel(String ftel) {
		this.ftel = ftel;
	}
	public String getPidnum() {
		return pidnum;
	}
	public void setPidnum(String pidnum) {
		this.pidnum = pidnum;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	
}
