package service;

import dto.Hospital;

public interface HospitalService {
	Hospital hospitalHinfo(Integer num)throws Exception;
	void HospitalModify(Hospital hospital) throws Exception;
}
