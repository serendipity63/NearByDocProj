package dao;

import dto.Hospital;

public interface HospitalDao {
	Hospital selectHospital(String comnum) throws Exception;

	void insertHospital(Hospital hospital) throws Exception;
	void updateHospital(Hospital hospital) throws Exception;
}
