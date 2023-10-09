package dto;

import java.util.Date;

public class Reservation {
	private Date date;
	private Date time;
	private String name;
	private String number;
	private String phone;
	private String address;
	private String opinion;
	private String subject;
	private String complete;
	
	
	public  Reservation(){}
	public Reservation(Date date, Date time , String name, String number, String phone, String address, String opinion, String subject,String complete) {
		this.date=date;
		this.time=time;
		this.name=name;
		this.number=number;
		this.phone=phone;
		this.address=address;
		this.opinion=opinion;
		this.subject=subject;
		this.complete=complete;

	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	
	
	
	
}
