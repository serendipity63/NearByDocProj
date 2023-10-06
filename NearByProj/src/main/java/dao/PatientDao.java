package dao;

import dto.Patient;

public interface PatientDao {
	Patient selectPatient(String pemail) throws Exception;

	void insertPatient(Patient patient) throws Exception;
}
