package dao;

import dto.Hospital;

public interface HospitalDao {
	Hospital selectHospital(String hemail) throws Exception;

	void insertHospital(Hospital hospital) throws Exception;
}
