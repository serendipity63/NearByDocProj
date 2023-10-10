package dao;


import dto.Patient;

public interface PatientDao {
	Patient selectPatient(String pidnum)throws Exception;
	void insertPatient(Patient patient) throws Exception;
	
	
	
}
