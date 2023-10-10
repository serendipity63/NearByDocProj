package service;

import dto.Patient;

public interface PatientService {
	Patient login(String pemail, String ppassword) throws Exception;

	void patientjoin(Patient patient) throws Exception;

	String pemailcheck(String pemail) throws Exception;
}
