package service;

import dto.Hospital;

public interface HospitalService {
	Hospital login(String hemail, String hpassword) throws Exception;

	void Hospitaljoin(Hospital hospital) throws Exception;
}
