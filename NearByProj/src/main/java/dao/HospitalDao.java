package dao;

import java.util.List;
import java.util.Map;

import dto.Hospital;

public interface HospitalDao {
	Hospital selectHospital(String comnum) throws Exception;
	void insertHospital(Hospital hospital) throws Exception;
	void updateHospital(Hospital hospital) throws Exception;

	List<Hospital> selectHospitalList(String department) throws Exception;

	void updateGrade(Map<String, String> param) throws Exception;
}
