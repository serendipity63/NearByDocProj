package dto;

import java.math.BigDecimal;

public class Hospital {
	private String hname;
	private String hpassword;
	private String comnum;
	private String htel;
	private String department;
	private String lunch;
	private String clinic;
	private String hroad;
	private String hdong;
	private String hdetail;
	private String hpostcode;
	private String hurl;
	private BigDecimal hgrade;
	private Integer hreviewcnt;
	private BigDecimal lat;
	private BigDecimal lon;

	public Hospital() {

	}

	public Hospital(String hname, String hpassword, String comnum, String htel, String department, String lunch,
			String clinic, String hroad, String hdong, String hdetail, String hpostcode, String hurl, BigDecimal hgrade,
			Integer hreviewcnt, BigDecimal lat, BigDecimal lon) {
		this.hname = hname;
		this.hpassword = hpassword;
		this.comnum = comnum;
		this.htel = htel;
		this.department = department;
		this.lunch = lunch;
		this.clinic = clinic;
		this.hdong = hdong;
		this.hroad = hroad;
		this.hdetail = hdetail;
		this.hpostcode = hpostcode;
		this.hurl = hurl;
		this.hgrade = hgrade;
		this.hreviewcnt = hreviewcnt;
		this.lat = lat;
		this.lon = lon;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHpassword() {
		return hpassword;
	}

	public void setHpassword(String hpassword) {
		this.hpassword = hpassword;
	}

	public String getComnum() {
		return comnum;
	}

	public void setComnum(String comnum) {
		this.comnum = comnum;
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

	public String getLunch() {
		return lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	public String getClinic() {
		return clinic;
	}

	public void setClinic(String clinic) {
		this.clinic = clinic;
	}

	public String getHroad() {
		return hroad;
	}

	public void setHroad(String hroad) {
		this.hroad = hroad;
	}

	public String getHdong() {
		return hdong;
	}

	public void setHdong(String hdong) {
		this.hdong = hdong;
	}

	public String getHdetail() {
		return hdetail;
	}

	public void setHdetail(String hdetail) {
		this.hdetail = hdetail;
	}

	public String getHpostcode() {
		return hpostcode;
	}

	public void setHpostcode(String hpostcode) {
		this.hpostcode = hpostcode;
	}

	public String getHurl() {
		return hurl;
	}

	public void setHurl(String hurl) {
		this.hurl = hurl;
	}

	public BigDecimal getHgrade() {
		return hgrade;
	}

	public void setHgrade(BigDecimal hgrade) {
		this.hgrade = hgrade;
	}

	public Integer getHreviewcnt() {
		return hreviewcnt;
	}

	public void setHreviewcnt(Integer hreviewcnt) {
		this.hreviewcnt = hreviewcnt;
	}

	public BigDecimal getLat() {
		return lat;
	}

	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}

	public BigDecimal getLon() {
		return lon;
	}

	public void setLon(BigDecimal lon) {
		this.lon = lon;
	}

}
