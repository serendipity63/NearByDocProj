package dto;


public class Hospital {
	private String comnum;
	private String department;
	private String hname;
	private String hemail;
	private String hpassword;
	private String htel;
	private String haddress;
	private String clinic;
	private String lunch;
	
	public Hospital() {}
	public Hospital(String comnum,String department,String hname,String hemail,String hpassword,String htel,String haddress,String clinic,String lunch) {
		this.comnum=comnum;
		this.department=department;
		this.hname=hname;
		this.hemail=hemail;
		this.hpassword=hpassword;
		this.htel=htel;
		this.haddress=haddress;
		this.clinic=clinic;
		this.lunch=lunch;
	}
	
	
	
}
