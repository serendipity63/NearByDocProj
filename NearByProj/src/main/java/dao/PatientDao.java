package dao;


import java.util.List;
import java.util.Map;

import dto.Patient;

public interface PatientDao {
	Patient selectPatient(String pidnum)throws Exception;
	void insertPatient(Patient patient) throws Exception;
	List<Patient> selectPatientList(Integer row) throws Exception;
	Integer selectPatientCount() throws Exception;
	
	List<Patient> searchPatientList(Map<String,Object>param) throws Exception;
	Integer searchPatientCount(Map<String,Object> param) throws Exception;
	
}
