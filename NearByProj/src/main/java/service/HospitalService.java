package service;

import dto.Hospital;

public interface HospitalService {
	Hospital login(String comnum, String hpassword) throws Exception;

	void hospitaljoin(Hospital hospital) throws Exception;
	
	String comnumcheck(String comnum) throws Exception;

	Hospital hospitalHinfo(Integer num)throws Exception;
	void HospitalModify(Hospital hospital) throws Exception;
}
