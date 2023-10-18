package dao;


import java.util.List;
import java.util.Map;

import dto.Patient;

public interface PatientDao {
	Patient selectPatient(String pemail)throws Exception;
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
	// 가족 구성원 조회
	public List<Map<String, Object>> selecetMyFamily(String pidnum) throws Exception;
	//가족 구성원 추가
	public void addFamily(Patient patient) throws Exception;
	//가족 구성원 삭제
	public void deleteFamily(String pname) throws Exception;
	//가족 정보 수정
	public void famInfoUpdate(Patient patient) throws Exception;
	
	
	Patient selectPatientByname(String pname) throws Exception;
	
	List<Patient> patientListBypidnum(String pidnum) throws Exception;
}
