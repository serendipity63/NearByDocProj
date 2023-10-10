package service;

import java.util.Map;

public interface PatientService {
	Map<String,Object> patientSearch (String type,String keyword,Integer page) throws Exception;
}
