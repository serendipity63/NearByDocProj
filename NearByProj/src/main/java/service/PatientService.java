package service;

import java.util.Map;

import dto.Patient;

public interface PatientService {
	Patient login(String pemail, String ppassword) throws Exception;

	void patientjoin(Patient patient) throws Exception;

	String pemailcheck(String pemail) throws Exception;
	
	Map<String,Object> patientListByPage(Integer page) throws Exception;
	Map<String,Object> patientSearch (String type,String keyword,Integer page) throws Exception;
	
	
	Patient myInfo(String pidnum) throws Exception;
	void modiProfile(Patient patient) throws Exception;
	void leavePatient (String pidnum) throws Exception;
}
