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
	
	
	
	// pidnum으로 환자 정보 조회
	Patient selectPatientByPidnum(String pidnum)throws Exception;
	// 환자 개인 정보 업데이트
	void updatePatient(Patient patient) throws Exception;
	// 환자 정보 삭제
	void deletePatient(String pidnum) throws Exception;
	
}
