package service;

import java.util.Map;

import dto.Patient;

public interface PatientService {
	Patient login(String pemail, String ppassword) throws Exception;

	void patientjoin(Patient patient) throws Exception;

	String pemailcheck(String pemail) throws Exception;

	Map<String,Object> patientSearch (String type,String keyword,Integer page) throws Exception;
}
