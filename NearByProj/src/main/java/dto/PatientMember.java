package dto;

public class PatientMember {
	private String email;
	private String password;
	private String name;
	private Integer phonenumber;
	private Integer idnumber;
	private String address;

	public PatientMember() {

	}

	public PatientMember(String email, String password, String name, Integer phonenumber, Integer idnumber,
			String address) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phonenumber = phonenumber;
		this.idnumber = idnumber;
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(Integer phonenumber) {
		this.phonenumber = phonenumber;
	}

	public Integer getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(Integer idnumber) {
		this.idnumber = idnumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
