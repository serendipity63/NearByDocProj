package service;

import java.util.List;

import dto.Hospital;

public interface HospitalService {
	Hospital login(String comnum, String hpassword) throws Exception;

	void hospitaljoin(Hospital hospital) throws Exception;


	String comnumcheck(String comnum) throws Exception;

	Hospital hospitalHinfo(Integer num) throws Exception;
	
	
	List<Hospital> hospitalList() throws Exception;
	Hospital selectHospitalBycomnum(String comnum) throws Exception;

	Hospital hospitalModify(String comnum);

	
}
