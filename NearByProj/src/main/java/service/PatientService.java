package service;

import java.util.List;
import java.util.Map;

import dto.Patient;

public interface PatientService {
	void patientReserve(Patient patient)throws Exception;
	Patient login(String pemail, String ppassword) throws Exception;

	void patientjoin(Patient patient) throws Exception;

	String pemailcheck(String pemail) throws Exception;
	String pidnumcheck(String pidnum) throws Exception;
	
	Map<String,Object> patientListByPage(Integer page) throws Exception;
	Map<String,Object> patientSearch (String type,String keyword,Integer page) throws Exception;
	
	
	Patient myInfo(String pidnum) throws Exception;

	void modiProfile(Patient patient) throws Exception;
	void leavePatient (String pidnum) throws Exception;
	

	
	void patientRemove (String pname)throws Exception;
	Patient selectPatientByname(String pname) throws Exception;

	
	
	public List<Map<String, Object>> famList(String pidnum) throws Exception;
	public String addFam (Patient patient, String pidnum) throws Exception;
	public void famDelete(String pname) throws Exception;
	public void famUpdate(Patient patient) throws Exception;
	

	List<Patient> patientListBypidnum(String pidnum) throws Exception;

}
